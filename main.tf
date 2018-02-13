terraform {
  required_version = ">= 0.11.1"
}

provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_instance" "ubuntu" {
  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  availability_zone = "${var.aws_region}a"
  key_name = "${var.key_name}"
  associate_public_ip_address = "true"
  root_block_device {
    volume_size = "${var.volume_size}"
  }
  tags {
    Name = "${var.name}"
  }
}
