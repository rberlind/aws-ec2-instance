terraform {
  required_version = ">= 0.11.8"
}
# Set VAULT_TOKEN environment variable
provider "vault" {
  address = "${var.vault_addr}"
}

# AWS credentials from Vault
data "vault_aws_access_credentials" "aws_creds" {
  backend = "aws-tf"
  role = "deploy"
}

# Insert 15 second delay so AWS credentials definitely available
# at all AWS endpoints
data "external" "region" {
  # Delay so that new keys are available across AWS
  program = ["./delay-vault-aws", "${var.aws_region}"]
}

#  Setup the AWS provider
provider "aws" {
  access_key = "${data.vault_aws_access_credentials.aws_creds.access_key}"
  secret_key = "${data.vault_aws_access_credentials.aws_creds.secret_key}"
  region  = "${data.external.region.result["region"]}"
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
    owner = "Roger"
    ttl = "24"
  }
}
