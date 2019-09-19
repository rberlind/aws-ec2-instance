variable "ami_id" {}
variable "instance_type" {}
variable "aws_region" {}
variable "volume_size" {}
variable "name" {}

resource "aws_instance" "ubuntu-three" {
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
