path "secret/data/foo" {
  capabilities = ["read", "list"]
}

path "sys/renew/*" {
  capabilities = ["update"]
}

path "sys/mounts" {
  capabilities = ["read"]
}