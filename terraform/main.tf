provider "aws" {
  region  = "eu-west-2"
}

resource "aws_vpc" "inventory-vpc" {
  tags {
    Name = "Inventory - VPC"
  }
  cidr_block = "11.3.0.0/16"
}

resource "aws_subnet" "elb-subnet" {
  vpc_id = "${aws_vpc.inventory-vpc.id}"
  cidr_block = "0.0.0.0/0"
  map_public_ip_on_launch = true
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
  name ="inventory-sg-elb"
  description = "Allow all inbound traffic through port 80 and 443."
  vpc_id ="${aws_vpc.inventory-vpc.id}"

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
  name ="inventory-app"
  description = "Allow all inbound traffic through port 3000 only"
  vpc_id ="${aws_vpc.inventory-vpc.id}"

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
  name ="inventory-db"
  description = "Allow all inbound traffic through port 5432 only"
  vpc_id ="${aws_vpc.inventory-vpc.id}"

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

# resource "aws_elb" "elb" {
#   name = "inventory-elb"
#   subnets = ["${aws_subnet.elb-subnet.id}", 
#             "${aws_subnet.inventory-web.id}",
#             "${aws_subnet.inventory-db.id}"]
# }

resource "aws_instance" "inventory-web" {
  ami =   "ami-996372fd"
  instance_type = "t2.micro"
  
  
  tags {
    Name = "web-inventory"
  }
}

resource "random_string" "password" {
  length = 16
  special = true
}

resource "aws_db_instance" "inventory-db" {
  engine               = "postgres"
  instance_class =  "db.t2.micro"
  allocated_storage = 8
  name = "spartaInventoryDb"
  username ="inventory"
  password =  "${random_string.password.result}"
  
  tags {
    Name = "db-inventory"
  } 
}