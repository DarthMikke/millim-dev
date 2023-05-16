#!/usr/bin/env python3
import glob, subprocess
confs = glob.glob("/srv/portfolio/*/apache/dev.conf")

for conf in confs:
  parts = conf.split("/")
  project = parts[1]
  newconf = "/srv/portfolio/apache/" + project + ".conf"

  subprocess.run(["cp", conf, newconf])
