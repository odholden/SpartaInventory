provider "aws" {
  region = "${var.aws_region}"
}

# Create VPC
resource "aws_vpc" "academy" {
  tags {
      Name = "Academy Tools"
  }
  cidr_block = "11.0.0.0/16"
}

# Create internet gateway
resource "aws_internet_gateway" "default" {
  vpc_id = "${aws_vpc.academy.id}"
}

# Add route to internet gateway in route table
resource "aws_route" "internet_access" {
  route_table_id         = "${aws_vpc.academy.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.default.id}"
}

# add public and private subnets
resource "aws_subnet" "web" {
  vpc_id                  = "${aws_vpc.academy.id}"
  cidr_block              = "11.0.1.0/24"
  map_public_ip_on_launch = false
  tags {
      Name = "Web - Private"
  }
}

resource "aws_subnet" "db" {
  vpc_id                  = "${aws_vpc.academy.id}"
  cidr_block              = "11.0.2.0/24"
  map_public_ip_on_launch = false
  tags {
      Name = "DB - Private"
  }
}

resource "aws_subnet" "elb" {
  vpc_id                  = "${aws_vpc.academy.id}"
  cidr_block              = "11.0.3.0/24"
  map_public_ip_on_launch = true
  tags {
      Name = "ELB - Public"
  }
}

resource "aws_security_group" "elb" {
  name        = "Web ELB"
  description = "Web Tier Load Balancer"
  vpc_id      = "${aws_vpc.academy.id}"

  # HTTP access from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "web" {
  name        = "Web"
  description = "Web Tier"
  vpc_id      = "${aws_vpc.academy.id}"

  # HTTP access from anywhere
  ingress {
    from_port   = "${var.web_port}"
    to_port     = "${var.web_port}"
    protocol    = "tcp"
    security_groups= ["${aws_security_group.elb.id}"]
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "db" {
  name        = "DB"
  description = "DB Tier"
  vpc_id      = "${aws_vpc.academy.id}"

  # HTTP access from anywhere
  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    security_groups= ["${aws_security_group.web.id}"]
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

data "aws_ami" "web" {
  filter {
    name   = "state"
    values = ["available"]
  }

  filter {
    name   = "name"
    values = ["web-prod*"]
  }

  most_recent = true
}

data "template_file" "init_script" {
  template = "${file("${path.module}/init.sh")}"

  vars {
    port = "${var.web_port}"
    environment = "${var.environment}"
    database_url = "${var.database_url}"
  }
}

#resource "aws_instance" "web" {

 # instance_type = "t2.micro"
 # ami           = "${data.aws_ami.web.id}"
 # vpc_security_group_ids = ["${aws_security_group.web.id}"]
 # subnet_id = "${aws_subnet.web.id}"
 # user_data = "${data.template_file.init_script.rendered}"
 # tags {
 #     Name = "web"
 # }
#}

resource "aws_elb" "web" {
  name = "Web"

  subnets         = ["${aws_subnet.elb.id}"]
  security_groups = ["${aws_security_group.elb.id}"]
  # instances       = ["${aws_instance.web.id}"]

  listener {
    instance_port     = "${var.web_port}"
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
      healthy_threshold   = 2
      unhealthy_threshold = 2
      timeout             = 3
      target              = "HTTP:3000/login"
      interval            = 60
  }
}

resource "aws_autoscaling_group" "web-asg" {
  availability_zones   = ["eu-west-2a"]
  name                 = "web-asg"
  max_size             = 10
  min_size             = 1
  desired_capacity     = 1
  force_delete         = true
  launch_configuration = "${aws_launch_configuration.web-lc.name}"
  load_balancers       = ["${aws_elb.web.name}"]

  vpc_zone_identifier = ["${aws_subnet.web.id}"]
  tag {
    key                 = "Name"
    value               = "web-asg"
    propagate_at_launch = "true"
  }
}

resource "aws_launch_configuration" "web-lc" {
  name          = "web-lc"
  image_id      = "${data.aws_ami.web.id}"
  instance_type = "t2.micro"
  
  # Security group
  security_groups = ["${aws_security_group.web.id}"]
  user_data = "${data.template_file.init_script.rendered}"

}
