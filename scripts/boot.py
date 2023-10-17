#!/usr/bin/env python3
import os
import subprocess
import time

# Check if the key is uploaded
if not os.path.exists("/ssh/github.key"):
    print("Place the private key in /ssh/github.key")
    print("Shutting down in 10 minutes.")
    time.sleep(600)
    exit(10)
else:
    print("Found the private key.")

# Add github to .known_hosts

print("Add github to .known_hosts")
try:
    with open("/root/.ssh/known_hosts", 'w') as fh:
        res = subprocess.run(
            ["ssh-keyscan", "-t", "rsa", "github.com"],
            stdout=fh
        )
    res.check_returncode()
except Exception as e:
    print(e)
    exit(11)

PORTFOLIO = '/srv/portfolio'
CONFIG = '/srv/apache'

# Check if the served files dir exists
if not os.path.exists(f"{PORTFOLIO}/.git"):
    print("Portfolio directory does not exist, setting up.")
    try:
        res = subprocess.run(
            ["git", "clone", os.environ['SERVE_GIT'], PORTFOLIO]
        )
        res.check_returncode()
    except Exception as e:
        print(e)
        exit(1)

    os.chdir(PORTFOLIO)
    print(f"Checking out branch {os.environ['SERVE_BRANCH']}.")
    try:
        res = subprocess.run(
            ["git", "checkout", os.environ['SERVE_BRANCH']])
        res.check_returncode()
    except Exception as e:
        print(e)
        exit(2)

    print(f"Initiating submodules.")
    try:
        res = subprocess.run(
            ["git", "submodule", "update", "--init", "--recursive"]
        )
        res.check_returncode()
    except Exception as e:
        print(e)
        exit(5)


# Check if the configs dir exists
if not os.path.exists(f"{CONFIG}/.git"):
    print("Config directory does not exist, setting up.")
    try:
        res = subprocess.run(
            ["git", "clone", os.environ['CONF_GIT'], "/srv/apache"]
        )
        res.check_returncode()
    except Exception as e:
        print(e)
        exit(3)

    os.chdir("/srv/apache")
    print(f"Checking out branch {os.environ['CONF_BRANCH']}.")
    try:
        res = subprocess.run(
            ["git", "checkout", os.environ['CONF_BRANCH']])
        res.check_returncode()
    except Exception as e:
        print(e)
        exit(4)
