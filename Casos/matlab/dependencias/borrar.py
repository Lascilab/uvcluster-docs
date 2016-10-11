#!/usr/bin/env python2

from os import listdir,remove
from os.path import isfile, join

archivos = ["borrar.py","ejecutar.sh","myfunc1.m","myfunc2.m","mymain.m","mymain.submit"]

for f in listdir("./"):
  if isfile(join("./", f)) and f not in archivos:
    remove(f)
