# -*- coding: utf-8 -*-
#!/usr/bin/python
import sys
libro=open(sys.argv[1],"r+")
diccionarioFrec={}
for palabra in libro.read().split():
    if palabra not in diccionarioFrec:
        diccionarioFrec[palabra] = 1
    else:
        diccionarioFrec[palabra] += 1
for palabra,frecuencia in diccionarioFrec.items():
    print palabra.replace(',', '')+','+str(frecuencia)
