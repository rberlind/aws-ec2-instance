provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "ubuntu" {
  # count         = 3
  ami           = var.ami_id
  instance_type = var.instance_type
  availability_zone = format("%sb", var.aws_region)
  associate_public_ip_address = var.associate_public_ip_address

  tags = {
    Name  = var.name
    ttl   = 24
    Owner = "rberlind"
  }
}
