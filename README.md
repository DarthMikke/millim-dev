# millim-dev

## File structure

Defined in code:
- `/srv/portfolio`: served directory
- `/srv/config`: HTTPD config files
- `/ssh`: Place for Github private key

`/srv` and `/ssh` are marked as volumes in Dockerfile.

Advised directories:
- `/srv/certs`: An obvious place for SSL certificates
