# Check key size
openssl rsa -in key.pem -text -noout

# Generate a key and a self-signed cert
openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365 -nodes