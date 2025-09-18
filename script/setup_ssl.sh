#!/bin/bash

# BlackSea SSL Setup Script
# This script sets up SSL certificates using Let's Encrypt for blacksea.click

set -e

DOMAIN="blacksea.click"
EMAIL="admin@blacksea.click"

echo "Setting up SSL certificates for $DOMAIN"

# Install certbot if not installed
if ! command -v certbot &> /dev/null; then
    echo "Installing certbot..."
    sudo apt update
    sudo apt install -y certbot python3-certbot-nginx
fi

# Stop nginx temporarily for certbot
echo "Stopping nginx for certificate generation..."
sudo systemctl stop nginx

# Generate SSL certificate
echo "Generating SSL certificate..."
sudo certbot certonly --standalone \
    --email "$EMAIL" \
    --agree-tos \
    --no-eff-email \
    --domain "$DOMAIN" \
    --domain "www.$DOMAIN"

# Start nginx again
echo "Starting nginx..."
sudo systemctl start nginx

# Set up auto-renewal
echo "Setting up certificate auto-renewal..."
sudo crontab -l | { cat; echo "0 12 * * * /usr/bin/certbot renew --quiet"; } | sudo crontab -

# Test renewal
echo "Testing certificate renewal..."
sudo certbot renew --dry-run

echo "SSL setup completed successfully!"
echo "Certificate location: /etc/letsencrypt/live/$DOMAIN/"
echo "Auto-renewal configured for daily checks"