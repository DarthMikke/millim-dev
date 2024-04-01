# millim-devbox

## What is it?
A development environment combining battle-proven Dsnmasq as a local DNS server 
and Httpd as reliable webhost. You can take advantage of multitude httpd's
modules, with __mod_rewrite__, __mod_ssl__ and __mod_wsgi__ enabled by default.
Thus the webhost can be a combination of file server, reverse proxy and
WSGI for Flask and Django applications.

## Keep it in sync: Versioned environment
Keeping multiple development environments in sync can be a pain. Both the
configuration directory, hosted directory and DNS records can be
versioned. Pass the git repo addresses and branches as environment variables,
as described in `stack.sample.env`.

## Why?
It's a simple way of ensuring that dependencies and environments are the same
in both live and multiple development environments, especially Apache setup
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
  Dnsmasq configuration. Bind to a volume to take advantage of configuration
  versioned in git.

## Easy to use on MacOS

A startup script will setup the local DNS for you if you use MacOS. By default
it assumes you use Wi-Fi. If you use a different network, set it as a `NETWORK`
variable before running the script, e.g.:

```bash
export NETWORK=Ethernet; scripts/start
```

If you struggle with getting the local DNS to work on MacOS, a combination
of these commands might help you troubleshoot your issues:
- `dscacheutil -q host -a name example.com` [1]
- `scutil --dns` [2]

### First-time setup on MacOS

Docker's default setup prevents setting localhost as your DNS servers. To allow
that, make sure that setting _Use kernel networking for UDP_ is __unchecked__.
You will find this setting under Docker Desktop > Settings > Resources >
Network.


[1](https://superuser.com/questions/1400250/how-to-query-macos-dns-resolver-from-terminal)
[2](https://apple.stackexchange.com/questions/98021/how-can-i-display-the-current-dns-servers-from-the-command-line-under-os-x)
