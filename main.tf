provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "ubuntu" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  availability_zone           = "${var.aws_region}b"
  associate_public_ip_address = "true"
  root_block_device {
    volume_size = 10
  }
  tags = {
    Name  = var.name
    owner = "roger@hashicorp.com"
    ttl   = "-1"
  }
}

module "nested" {
  source = "./module"
  ami_id = var.ami_id
  instance_type = var.instance_type
  aws_region = var.aws_region
  name = var.name
  volume_size = 10
}
