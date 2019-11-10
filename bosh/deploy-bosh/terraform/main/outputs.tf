output "subnet_id" {
    value = aws_subnet.bosh_public_subnet.id
}
output "az" {
  value = var.default_az
}

output "static_ip" {
    value = aws_eip.static_ip.public_ip
}

output "bosh_ssh_key" {
  value = module.tls.ssh_private_key
}

output "internal_cidr" {
  value = aws_subnet.bosh_public_subnet.cidr_block
}

output "internal_gateway" {
  value = cidrhost(aws_subnet.bosh_public_subnet.cidr_block, 0)
}

output "internal_ip" {
  value = cidrhost(aws_subnet.bosh_public_subnet.cidr_block, 6)
}

output "default_key_name" {
  value = aws_key_pair.bosh.key_name
}

output "default_security_groups" {
  value = [aws_security_group.bosh.name]
}