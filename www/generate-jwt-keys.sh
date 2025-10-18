#!/bin/bash

# Create JWT directory
mkdir -p config/jwt

# Generate private key
openssl genpkey -out config/jwt/private.pem -aes256 -algorithm rsa -pkeyopt rsa_keygen_bits:4096 -pass pass:your-passphrase-here

# Generate public key
openssl pkey -in config/jwt/private.pem -out config/jwt/public.pem -pubout -passin pass:your-passphrase-here

echo "JWT keys generated successfully!"
echo "Private key: config/jwt/private.pem"
echo "Public key: config/jwt/public.pem"
echo "Passphrase: your-passphrase-here"

