provider "aws" {
  alias = "hard-coded-in-module"
  region = "us-east-1"
}

resource "aws_instance" "ubuntu" {
  ami           = "ami-2e1ef954"
  instance_type = "t2.micro"
  availability_zone = "us-east-1a"
  provider = "aws.hard-coded-in-module"

  tags {
    Name = "from_module"
  }
}
