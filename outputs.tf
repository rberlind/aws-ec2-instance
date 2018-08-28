output "public_dns" {
  value = "${aws_instance.ubuntu.public_dns}"
}

output "public_dns_2" {
  value = "${aws_instance.ubuntu2.public_dns}"
}
