provider "aws" {
  region  = "eu-west-2"
  
}

resource "aws_vpc" "inventory-vpc" {
  tags {
    Name = "Inventory - VPC"
  }
  cidr_block = "11.3.0.0/16"
}

resource "aws_internet_gateway" "default" {
  vpc_id = "${aws_vpc.inventory-vpc.id}"
}

resource "aws_route_table" "local" {
  vpc_id = "${aws_vpc.inventory-vpc.id}"
}

resource "aws_route" "internet_access" {
  route_table_id         = "${aws_vpc.inventory-vpc.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.default.id}"
}

resource "aws_route_table_association" "db" {
  subnet_id = "${aws_subnet.inventory-db.id}"
  route_table_id = "${aws_route_table.local.id}"
}

resource "aws_subnet" "elb-subnet" {
  vpc_id = "${aws_vpc.inventory-vpc.id}"
  cidr_block = "11.3.3.0/24"
  map_public_ip_on_launch = true
  tags {
    Name = "inventory-elb"
  }

}

resource "aws_subnet" "inventory-web" {
  vpc_id = "${aws_vpc.inventory-vpc.id}"
  cidr_block = "11.3.1.0/24"
  map_public_ip_on_launch = false
  tags {
    Name = "inventory-app"
  }
}

resource "aws_subnet" "inventory-db" {
  vpc_id = "${aws_vpc.inventory-vpc.id}"
  cidr_block = "11.3.2.0/24"
  map_public_ip_on_launch = false
  tags {
    Name = "inventory-db"
  }
}
resource "aws_security_group" "inventory-sg-elb"  {
  name = "inventory-sg-elb"
  description = "Allow all inbound traffic through port 80 and 443."
  vpc_id = "${aws_vpc.inventory-vpc.id}"

  ingress{
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  ingress{
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  egress{
    from_port       = 3000
    to_port         = 3000
    protocol        = "0"
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

  ingress{
    from_port       = 3000
    to_port         = 3000
    protocol        = "tcp"
    security_groups = ["${aws_security_group.inventory-sg-elb.id}"]
  }

  egress{
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

  ingress{
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = ["${aws_security_group.inventory-sg-app.id}"]
  }

  egress{
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
  subnets = ["${aws_subnet.inventory-web.id}"]
  security_groups = ["${aws_security_group.inventory-sg-elb.id}"]
  # availability_zones = ["eu-west-2a"]

  listener {
    instance_port = 3000
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }

  health_check {
    healthy_threshold = 3
    unhealthy_threshold = 2
    interval = 30
    target = "HTTP:3000/"
    timeout = 3
  }
  
  instances = ["${aws_instance.inventory-web.id}"]

}

resource "aws_instance" "inventory-web" {
  ami =   "ami-20a4b744"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.inventory-web.id}"
  tags {
    Name = "web-inventory"
  }

   user_data = "${data.template_file.init_script.rendered}"

  depends_on = ["aws_db_instance.inventory-db"]
}

data "template_file" "init_script" {
  template = "${file("${path.module}/init.sh")}"
}

resource "random_string" "password" {
  length = 16
  special = true
}

resource "aws_db_instance" "inventory-db" {
  engine               = "postgres"
  instance_class =  "db.t2.micro"
  ami = "ami-a4a5b6c0"
  # db_subnet_group_name = "inventory-db"
  allocated_storage = 8
  name = "spartaInventoryDb"
  username ="inventory"
  password =  "${random_string.password.result}"
  
  tags {
    Name = "db-inventory"
  } 
}