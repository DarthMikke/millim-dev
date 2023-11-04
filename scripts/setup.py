#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import os
import subprocess
import glob
import time

PORTFOLIO = '/srv/portfolio'


def locate_setup(project_path):
    filenames = [x for x in glob.glob(os.path.)
                 if os.path.isfile(x)]
    


projects = [x for x in glob.glob(f"{PORTFOLIO}/*")
            if os.path.isdir(x)]

for project_path in projects:
    project = os.path.basename(project_path)
    print(f"Setting up {project}...")
    res = subprocess.run(
        [f"{project_path}/scripts/setup"],
    )
