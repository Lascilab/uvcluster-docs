#!/usr/bin/env python2

from os import listdir,remove
from os.path import isfile, join

archivos = ["dag.png", "borrar.py","collect.m","collect.submit","dagman.dag","ejecutar.sh","initialize.m","initialize.submit","product.m","product.submit"]

for f in listdir("./"):
  if isfile(join("./", f)) and f not in archivos:
    remove(f)
