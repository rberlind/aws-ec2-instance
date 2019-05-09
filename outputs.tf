output "public_dns" {
  value = "${aws_instance.ubuntu.*.public_dns}"
}

output "public_dns_too" {
  value = "${aws_instance.ubuntu-too.*.public_dns}"
}
