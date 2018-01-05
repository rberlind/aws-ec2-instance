terraform {
  required_version = ">= 0.11.0"
}

variable "aws_region" {
  description = "AWS region"
  default = "us-east-1"
}

variable "ami_id" {
  description = "ID of the AMI to provision. Default is Ubuntu 14.04 Base Image"
  default = "ami-2e1ef954"
}

variable "instance_type" {
  description = "type of EC2 instance to provision."
  default = "t2.micro"
}

provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_instance" "ubuntu" {
  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  availability_zone = "${var.aws_region}-1a"

  tags {
    Name = "Provisioned-by-Terraform"
  }
}
