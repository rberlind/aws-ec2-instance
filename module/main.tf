variable "ami_id" {}
variable "instance_type" {}
variable "aws_region" {}
variable "volume_size" {}
variable "name" {}

resource "aws_instance" "ubuntu-too" {
  count                       = 1
  ami                         = "${var.ami_id}"
  instance_type               = "${var.instance_type}"
  availability_zone           = "${var.aws_region}a"
  associate_public_ip_address = "true"

  root_block_device {
    volume_size = "${var.volume_size}"
  }

  tags = {
    Name  = "${var.name}"
    owner = "Roger"
    ttl   = "24"
  }
}

module "nested-again" {
  source        = "./module"
  ami_id        = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  aws_region    = "${var.aws_region}"
  volume_size   = "${var.volume_size}"
  name          = "${var.name}"
}
