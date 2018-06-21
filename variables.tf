variable "aws_region" {
  description = "AWS region"
  default = "eu-west-2"
}

variable "ami_id" {
  description = "ID of the AMI to provision. Default is Ubuntu 14.04 Base Image"
  default = "ami-524e5736"
}

variable "instance_type" {
  description = "type of EC2 instance to provision."
  default = "t2.small"
}

variable "name" {
  description = "name to pass to Name tag"
  default = "Provisioned very quickly by Terraform"
}

variable "key_name" {
  description = "name of the SSH key for accessing the instance"
}

variable "volume_size" {
  description = "the size of root device"
  default = "10"
}
