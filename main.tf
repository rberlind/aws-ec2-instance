terraform {
  required_version = ">= 0.11.1"
}

provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_instance" "this" {
  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  availability_zone = "${var.aws_region}b"
  associate_public_ip_address = "${var.associate_public_ip_address}"
  tags = {
    Name = "${var.name}"
  }
}
