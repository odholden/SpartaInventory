provider "aws" {
  region  = "eu-west-2" 
}

resource "aws_vpc" "inventory-vpc" {
  cidr_block = "11.3.0.0/16"
  
  tags {
    Name = "Inventory - VPC"
  }
}
data "aws_ami" "web" {
  filter {
    name   = "state"
    values = ["available"]
  }

  filter {
    name   = "name"
    values = ["div-web-prod*"]
  }

  most_recent = true
}


resource "aws_launch_configuration" "asg-config" {
  name_prefix = "asg-launch"
  image_id = "${data.aws_ami.web.id}"
  instance_type = "t2.micro"
  user_data = "${data.template_file.init_script.rendered}"
  security_groups = ["${aws_security_group.inventory-sg-app.id}"]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "inventory-asg" {
  availability_zones = ["eu-west-2a"]
  load_balancers = ["${aws_elb.elb.id}"]
  name = "inventory-scalegroup"
  min_size = 1
  max_size = 5
  desired_capacity = 1
  vpc_zone_identifier = ["${aws_subnet.inventory-web.id}"]
  launch_configuration = "${aws_launch_configuration.asg-config.id}"
  depends_on = ["aws_db_instance.inventory-db"]
}

resource "aws_autoscaling_policy" "scale-up" {
  name = "autoscale-up"
  scaling_adjustment = 1
  adjustment_type = "ChangeInCapacity"
  autoscaling_group_name = "${aws_autoscaling_group.inventory-asg.name}"
}

resource "aws_autoscaling_policy" "scale-down" {
  name = "autoscale-down"
  scaling_adjustment = -1
  adjustment_type = "ChangeInCapacity"
  autoscaling_group_name = "${aws_autoscaling_group.inventory-asg.name}"
}

resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.inventory-vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.default.id}"
  }

  tags {
    Name = "public"
  }
}

resource "aws_route_table" "semi-private" {
  vpc_id = "${aws_vpc.inventory-vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.inventory-nat-gw.id}"
  }

  tags {
    Name = "semi-private"
  }
}

resource "aws_default_route_table" "private" {
  default_route_table_id = "${aws_vpc.inventory-vpc.default_route_table_id}"

  tags {
    Name = "private"
  }
}

resource "aws_internet_gateway" "default" {
  vpc_id = "${aws_vpc.inventory-vpc.id}"
}

resource "aws_subnet" "elb-subnet" {
  vpc_id = "${aws_vpc.inventory-vpc.id}"
  cidr_block = "11.3.4.0/24"
  availability_zone = "eu-west-2a"
  map_public_ip_on_launch = true

  tags {
    Name = "inventory-elb"
  }
}

resource "aws_route_table_association" "elb" {
  subnet_id = "${aws_subnet.elb-subnet.id}"
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "app" {
  subnet_id = "${aws_subnet.inventory-web.id}"
  route_table_id = "${aws_route_table.semi-private.id}"
}

resource "aws_subnet" "inventory-web" {
  vpc_id = "${aws_vpc.inventory-vpc.id}"
  cidr_block = "11.3.1.0/24"
  availability_zone = "eu-west-2a"
  map_public_ip_on_launch = false

  tags {
    Name = "inventory-app"
  }
}

resource "aws_subnet" "inventory-db-a" {
  vpc_id = "${aws_vpc.inventory-vpc.id}"
  cidr_block = "11.3.2.0/24"
  availability_zone = "eu-west-2a"
  map_public_ip_on_launch = false
  tags {
    Name = "inventory-db-a"
  }
}

resource "aws_subnet" "inventory-db-b" {
  vpc_id = "${aws_vpc.inventory-vpc.id}"
  cidr_block = "11.3.3.0/24"
  availability_zone = "eu-west-2b"
  map_public_ip_on_launch = false

  tags {
    Name = "inventory-db-b"
  }
}
resource "aws_security_group" "inventory-sg-elb"  {
  name = "inventory-sg-elb"
  description = "Allow all inbound traffic through port 80 and 443."
  vpc_id = "${aws_vpc.inventory-vpc.id}"

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  egress{
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags {
    Name = "inventory-sg-elb"
  }
}

resource "aws_security_group" "inventory-sg-app"  {
  name = "inventory-app"
  description = "Allow all inbound traffic through port 3000 only"
  vpc_id = "${aws_vpc.inventory-vpc.id}"

  ingress {
    from_port       = 3000
    to_port         = 3000
    protocol        = "tcp"
    security_groups = ["${aws_security_group.inventory-sg-elb.id}"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags {
    Name = "inventory-SecurityGroup-app"
  }
}

resource "aws_security_group" "inventory-sg-db"  {
  name = "inventory-db"
  description = "Allow all inbound traffic through port 5432 only"
  vpc_id = "${aws_vpc.inventory-vpc.id}"

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = ["${aws_security_group.inventory-sg-app.id}"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags {
    Name = "inventory-SecurityGroup-db"
  }
}

resource "aws_elb" "elb" {
  name = "inventory-elb"
  subnets = ["${aws_subnet.elb-subnet.id}",]
  security_groups = ["${aws_security_group.inventory-sg-elb.id}"]

  listener {
    instance_port = 3000
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }

  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    interval = 30
    target = "HTTP:3000/login"
    timeout = 15
  }
  
  # instances = ["${aws_instance.inventory-web.id}"]
  
  tags {
    Name = "inventory-elb"
  }
 }

resource "aws_eip" "inventory-nat-eip" {
}

resource "aws_nat_gateway" "inventory-nat-gw" {
  allocation_id = "${aws_eip.inventory-nat-eip.id}"
  subnet_id     = "${aws_subnet.elb-subnet.id}"
}

# resource "aws_instance" "inventory-web" {
#   ami =   "ami-d24654b6"
#   instance_type = "t2.micro"
#   subnet_id = "${aws_subnet.inventory-web.id}"
#   vpc_security_group_ids = ["${aws_security_group.inventory-sg-app.id}"]

#   tags {
#     Name = "web-inventory"
#   }

#   user_data = "${data.template_file.init_script.rendered}"

#   depends_on = ["aws_db_instance.inventory-db"]
# }

data "template_file" "init_script" {
  template = "${file("${path.module}/init.sh")}"
  vars {
    password = "${aws_db_instance.inventory-db.password}"
    endpoint = "${aws_db_instance.inventory-db.address}"
    username = "${aws_db_instance.inventory-db.username}"
    database_name = "${aws_db_instance.inventory-db.name}"
  }
}

resource "random_string" "password" {
  length = 16
  special = false
}
resource "aws_db_subnet_group" "inventory-db-group" {
  name = "main"
  subnet_ids = ["${aws_subnet.inventory-db-a.id}", "${aws_subnet.inventory-db-b.id}"]

  tags {
    Name = "DB-SUBNET-GROUP"
  }
}
resource "aws_db_instance" "inventory-db" {
  engine               = "postgres"
  instance_class =  "db.t2.micro"
  identifier = "inventory-db-id"
  # ami = "ami-a4a5b6c0"
  db_subnet_group_name = "${aws_db_subnet_group.inventory-db-group.name}"

  allocated_storage = 8
  name = "spartaInventoryDb"
  username ="inventory"
  password =  "${random_string.password.result}"
  vpc_security_group_ids = ["${aws_security_group.inventory-sg-db.id}"]
  skip_final_snapshot = true
  tags {
    Name = "db-inventory"
  } 
}