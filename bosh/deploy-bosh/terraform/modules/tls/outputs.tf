output "ssh_private_key" {
    value = tls_private_key.private_key_pme
}

output "ssh_public_key" {
    value = tls_private_key.public_key_pem
}