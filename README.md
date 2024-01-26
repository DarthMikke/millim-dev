# millim-devbox

## What is it?
A development environment consisting of Dsnmasq working as a DNS server 
and Httpd as webhost. The webhost can work as a combination of file server, 
reverse proxy and Django server.

## Versioned environment
Both the configuration directory, hosted directory and DNS records can be
versioned. Pass the git repo addresses and branches as environment variables,
as described in `stack.sample.env`.

## Why?
It's a simple way of ensuring that dependencies and environments are the same
in both live and development environments, especially Apache setup
and Python version.

## File structure

- `./srv/webprojects`: served directory
- `./srv/apache`: HTTPD config files
- `./srv/certs`: An obvious place for SSL certificates
- `./srv/ssh`: SSH folder for the webhost. Place your Github/Gitlab/Gitea 
  private key here, if you intend to use private git repos. You can configure it 
  by placing a `config` file here.
- `./dnsmasq`: Should contain a `hosts` file and a `dnsmasq.d` directory. All 
  files with extension `.conf` inside of `dnsmasq.d` will be included in the
  Dnsmasq configuration.

## Troubleshooting on Mac

Use a combination of these commands:
- `dscacheutil -q host -a name example.com` [1]
- `scutil --dns` [2]


[1](https://superuser.com/questions/1400250/how-to-query-macos-dns-resolver-from-terminal)
[2](https://apple.stackexchange.com/questions/98021/how-can-i-display-the-current-dns-servers-from-the-command-line-under-os-x)
