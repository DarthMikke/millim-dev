#!/usr/bin/env python3
import glob, subprocess

print("Deleting old configs...")
active_confs = glob.glob("/srv/portfolio/apache/*.conf")
for conf in active_confs:
  print(conf)
  subprocess.run(["rm", conf])

confs = glob.glob("/srv/portfolio/*/apache/dev.conf")

print("Copying configs...")
for conf in confs:
  parts = conf.split("/")
  project = parts[-3]
  newconf = "/srv/portfolio/apache/" + project + ".conf"

  print(conf, "\t=>\t", newconf)
  subprocess.run(["cp", conf, newconf])
