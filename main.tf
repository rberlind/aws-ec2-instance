terraform {
  required_version = ">= 0.11.1"
}

provider "aws" {
  region = "${var.aws_region}"
}

resource "random_integer" "rand" {
  min     = 1
  max     = 1000
}

resource "aws_instance" "ubuntu" {
  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  availability_zone = "${var.aws_region}b"
  associate_public_ip_address = "true"
  tags {
    Name = "${var.name}"
    owner = "roger@hashicorp.com"
    ttl = "48"
    Random = "${random_integer.rand.result}"
  }
}
