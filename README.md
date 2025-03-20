# WG Easier

## Description

This is a simplest way to run [wg-easy](https://github.com/wg-easy/wg-easy/tree/c6dce0f6fb2e28e7e40ddac1498bd67e9bb17cba) on your server.

## Requirements

- Docker
- Public Facing IP
- Open Ports: 51820/udp, 51821/tcp

## Usage

### Install Docker

If you haven't installed Docker yet, install it by running:

```shell
curl -sSL https://get.docker.com | sh
sudo usermod -aG docker $(whoami)
exit
```

### Install WG Easy

```bash
curl -fsSL https://raw.githubusercontent.com/dodysat/wg/main/wg.sh -O wg.sh && chmod +x wg.sh && exec ./wg.sh
```

PS: Provide secure password for the dashboard access.
