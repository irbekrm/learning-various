output "subnet_id" {
    value = aws_subnet.bosh_public_subnet.id
}
output "availability_zone" {
  value = var.default_az
}

output "static_ip" {
    value = aws_eip.static_ip.public_ip
}

output "bosh_ssh_key" {
  value = "module.tls.ssh_private_key"
}
