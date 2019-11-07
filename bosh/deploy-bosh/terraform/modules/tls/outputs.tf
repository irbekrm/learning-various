output "ssh_private_key" {
    value = tls_private_key.bosh_private_key.private_key_pem
}

output "ssh_public_key" {
    value = tls_private_key.bosh_private_key.public_key_pem
}