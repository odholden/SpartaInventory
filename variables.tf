variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "eu-west-2"
}

variable "web_port" {
  description = "Port to start the web server on"
  default     = "3000"
}

variable "environment" {
  description = "Dev, Testing, Production etc"
}

variable "database_url" {
  description = "Connection url for database"
}
