# WG Easier

## Description

This is a simplest way to run [wg-easy](https://github.com/wg-easy/wg-easy/tree/c6dce0f6fb2e28e7e40ddac1498bd67e9bb17cba) on your server.

## Requirements

- Docker
- Public Facing IP
- Open Ports: 51820/udp, 51821/tcp

## Usage

```bash
curl -fsSL -o wg.sh https://raw.githubusercontent.com/dodysat/wg/refs/heads/main/wg.sh
chmod +x wg.sh
./wg.sh
```

PS: Provide secure password for the dashboard access.
