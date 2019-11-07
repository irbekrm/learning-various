resource "tls_private_key" "bosh_private_key" {
    algorithm = "RSA"
    rsa_bits = 4096
}
