# millim-dev

## What is it?
What started as a development container environment for my web server,
became a production container for my web server.

## Why?
It's a simple way of ensuring that dependencies and environments are the same
in both live and development environments, especially Apache setup
and Python version.

## File structure

Defined in code:
- `/srv/portfolio`: served directory
- `/srv/config`: HTTPD config files
- `/ssh`: Place for Github private key

`/srv` and `/ssh` are marked as volumes in Dockerfile.

Advised directories:
- `/srv/certs`: An obvious place for SSL certificates
