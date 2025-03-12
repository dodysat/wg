#!/bin/bash

# Check Docker
if ! command -v docker &> /dev/null; then
    echo "Error: Docker not found"
    exit 1
fi

# Get IP
WG_HOST=$(curl -4 -s ifconfig.me) || { echo "IP detection failed"; exit 1; }

# Read password from terminal (not stdin)
read -sp "Enter admin password: " PASSWORD < /dev/tty
echo

# Repeat password
read -sp "Repeat password: " PASSWORD2 < /dev/tty
echo

# Check password
if [ "$PASSWORD" != "$PASSWORD2" ]; then
    echo "Error: Passwords do not match, please try again"
    exit 1
fi

# Generate hash
PASSWORD_HASH=$(docker run --rm -it ghcr.io/wg-easy/wg-easy wgpw "$PASSWORD" | grep -oP "PASSWORD_HASH='\K[^']+")

# Run container
docker run -d \
  --name wg-easy \
  --env LANG=en \
  --env WG_HOST="$WG_HOST" \
  --env PASSWORD_HASH="$PASSWORD_HASH" \
  --env PORT=51821 \
  --env WG_PORT=51820 \
  -v ~/.wg-easy:/etc/wireguard \
  -p 51820:51820/udp \
  -p 51821:51821/tcp \
  --cap-add NET_ADMIN \
  --cap-add SYS_MODULE \
  --sysctl net.ipv4.conf.all.src_valid_mark=1 \
  --sysctl net.ipv4.ip_forward=1 \
  --restart unless-stopped \
  ghcr.io/wg-easy/wg-easy

echo "Done! Dashboard: http://$WG_HOST:51821"