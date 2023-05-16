#!/usr/bin/env python3
import glob, subprocess
confs = glob.glob("/srv/portfolio/*/apache/dev.conf")

for conf in confs:
  parts = conf.split("/")
  project = parts[-3]
  newconf = "/srv/portfolio/apache/" + project + ".conf"

  print("Copying", conf, "\t=>\t", newconf)
  subprocess.run(["cp", conf, newconf])
