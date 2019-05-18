#!/usr/bin/env python2

from os import listdir,remove
from os.path import isfile, join

archivos = ["borrar.py","ejecutar.sh","hola.m","hola.submit"]

for f in listdir("./"):
  if isfile(join("./", f)) and f not in archivos:
    remove(f)
