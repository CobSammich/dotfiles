#!/usr/bin/env python

import glob
import random
import os


files = glob.glob("/home/cob/Pictures/wallpapers/*")
files_vert = glob.glob("/home/cob/Pictures/wallpapers/vertical/*")

random.shuffle(files)
random.shuffle(files_vert)

command = "feh --no-fehbg --bg-fill " + files[0] + " " + files_vert[0] + " " + files[1]
os.system(command)
