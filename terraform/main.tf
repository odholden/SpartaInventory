provider "aws" {
  region  = "eu-west-2"
}

resource "aws_vpc" "inventory-vpc" {
  tags {
    Name = "Inventory - VPC"
  }
  cidr_block = "11.3.0.0/16"
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
  password =  ${random_string.result}
  
  tags {
    Name = "db-inventory"
  } 
}