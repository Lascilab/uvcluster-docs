#Tutorial Uvclúster
=========

![](http://matematicas.univalle.edu.co/~olimpiadasmatematicas/orm_archivos/bannerPanoramica.jpg)

#El inicio
Sabemos que eres un ávido lector y que entre tus planes de este año se encuentra leer varios clásicos de la literatura universal. Has empezado a leer “El juicio” de Franz Kafka en su version angloparlante y rápidamente notas la gran cantidad de palabras contenidas en el libro, por lo que te preguntas ¿cual es la frecuencia de cada palabra en ese libro?.

Empiezas a contar y a anotar en una libreta cada una de las palabras, pero ya que esto se convierte en una tarea dispendiosa y ardua, recurres a tu computador. Sabes que utilizando Python (2.7, disponible por defecto en Ubuntu) podrías escribir un programa que resuelva el problema de hallar la frecuencia para cada palabra del libro mencionado e incluso de cualquier libro. 

> Este tutorial menciona algunas palabras poco claras por eso sugerimos ver algunas [Definiciones]

Abres un editor de texto y unos pocos minutos después escribes un script como el siguiente:

```
carlos@carlos-desktop:~/p $ nano contador.py
```
```python
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
```
> No importa mucho entender el código pero si deseas saberlo, el programa recorre línea por línea un archivo cuya dirección entra como argumento (ya veremos despues como ejecutarlo). Sabemos ingenuamente que las palabra en una línea estan separadas por un espacio (digo ingenuamente porque puede darse este caso “hola, jovenes, hola” ¿cual es la frecuencia de ‘hola’? Solamente uno. Pero no importa, podemos seguir campantes ignorando el hecho). Ahora, cada vez que encuentra una palabra, verifica si se encuentra almacenada en memoria, si lo está lo agrega a un diccionario de python, de lo contrario busca la palabra en el diccionario y aumenta el contador para dicha palabra. Al final imprime el contenido de dicho diccionario.

Luego descargas el libro en tu computador (o si eres un poco mas intrépido lo escaneas)

```bash
carlos@carlos-desktop:~/p $ wget http://www.gutenberg.org/cache/epub/7849/pg7849.txt
```
```bash
--2016-10-13 13:03:09--  http://www.gutenberg.org/cache/epub/7849/pg7849.txt
Resolviendo www.gutenberg.org (www.gutenberg.org)... 152.19.134.47, 2610:28:3090:3000:0:bad:cafe:47
Conectando con www.gutenberg.org (www.gutenberg.org)[152.19.134.47]:80... conectado.
Petición HTTP enviada, esperando respuesta... 200 OK
Longitud: 481098 (470K) [text/plain]
Grabando a: “pg7849.txt”

100%[===============================================================================================================================================>] 481.098      146KB/s   en 3,2s   

2016-10-13 13:03:14 (146 KB/s) - “pg7849.txt” guardado [481098/481098]
```

Y en cuestión de milisegundos obtienes la frecuencia de las palabras.

```bash
carlos@carlos-desktop:~/p $ python contador.py pg7849.txt
```
```bash
....
coats,1
mutual,1
improving,1
myself.",5
book,12
Five,1
branch,1
contacting,1
conclusion,2
junk,7
kinds,1
scribes,1
BEFORE,1
K.”,7
ranks,1
could,8
mistakenly,1
entirely.,2
entirely,2
seriously",1
fending,1
"Quiet!",1
```

El problema ha sido solucionado brevemente, pero es entonces cuando te preguntas ¿por qué alguien necesitaría un cluster?.

# El cluster
Después de leer otros libros, tus amigos te han pedido que halles la frecuencia de palabras en algunos de los libros que ellos han leído. Para ser exactos, unos 400 libros. Vuelves a tu computador pero, el programa que no se demoraba mucho ejecutando, ya no lo hace tan rápido, consume mucha memoria y cualquier momento podría fallar. Es entonces cuando recuerdas al [cluster](introducción) de la universidad, solicitas el [acceso](acceso) y accedes:

> A partir de ahora asumimos que el usuario en el cluster es ‘carlosc’ y la ip del cluster 45.68.55.22. La contraseña es ‘secreta’

```bash
carlos@carlos-desktop:~/p $ ssh carlosc@45.68.55.22
carlosc@carlosc-cluster:~   $ exit              # para salir
```

Copias la carpeta y los archivos en los que estas trabajando (¿deberiamos fomentar el uso de git?) [acceso, ssh] desde tu computador al cluster usando un program llamado scp.

```bash
carlos@carlos-desktop:~/p $ scp -r . carlosc@45.68.55.22:~
pg7849.txt                                            100%  470KB 469.8KB/s   00:00    
contador.py                                           100%  245     0.2KB/s       00:00
```

Aun afuera, sabes que puedes volver a entrar, moverte por el lugar y ver el contenido de cada carpeta usando `ls` [Curso de Linux]()

```bash
carlos@carlos-desktop:~/p $ ssh carlosc@45.68.55.22
carlosc@carlosc-cluster:~  $ ls
  pg7849.txt contador.py
```

Ya en el cluster, te preguntas: [y ahora ¿qué hago?](Forma de trabajo)
![](http://www.dailyfailcentral.com/sites/default/files/fail/aD3P7eN_700b.jpg)

#El administrador del cluster
La solución que salta a la vista para resolver el problema consiste instalar python junto con el  programa que has desarrollado y un conjunto de libros en cada uno de los computadores del cluster, Luego ejecutarlos y recolectar los resultados, pero siendo sinceros esto tomaría mucho tiempo. Por fortuna en el cluster contamos con un manejador de tareas que se encarga de distribuir tu programa y un conjunto de libros a todos los computadores. Tal programa es llamado [HTCondor](...).

http://www.arc.ox.ac.uk/content/torque-job-scheduler

Puedes por ejemplo ver qué tareas están ejecutando otros usuarios que siguieron al pie de la letra este tutorial:

```bash
carlosc@carlosc-cluster:~ $ condor_q
```

> A veces es un poco molesto trabajar en el cluster, por eso sugerimos hacer una pequeña réplica del mismo para llevar a cabo algunas pruebas. (como-replicar-el-ambiente-de-trabajo.md)

Para que HTCondor lleve a cabo nuestra tarea, debemos describir en un archivo el tipo de tarea que vamos a ejecutar, el ejecutable de la tarea, los archivos de entrada y salida y, no obstante, donde debe él guardar tanto el output, el error y el log. 


##Los tres mosqueteros: output, error y log

Interactuar con un programa en una consola es en muchos casos similar a hacerlo con una persona a través de tres canales establecidos: si esa persona te hace una pregunta (output o out) usa el primer canal para hacertela llegar. Pero ya que no se trata de una pregunta retórica, la respuesta se la haces llegar por otro canal (Input o in). Si esa persona se encuentra herida y no puede hablar, lo mas seguro es que manifieste su vulnerabilidad a través de señas o heridas (el canal de error o err). Estos tres se constituyen como los flujos estándar para la comunicación entre un programa de computador y su ambiente. Comúnmente ese ambiente es una consola en la que input corresponde a la entrada y output y error a la salida. |Mejorar esto| 

Emocionado por esta posibilidad, vamos entonces a describir el programa en un [‘submitfile’](HTCondor-Submitfiles): 

```
carlosc@carlosc-cluster:~/p $ mkdir out
carlosc@carlosc-cluster:~/p $ nano contador.submitfile
universe                = vanilla
executable              = /usr/bin/python
arguments               = contador.py pg7849.txt
should_transfer_files   = YES
transfer_input_files    = contador.py, pg7849.txt
when_to_transfer_output = ON_EXIT
output                  = out/out.$(Process)
error                   = err.$(Process)
log                     = log.$(Process)
queue 1
```

Nuestro sabor favorito de helado es la vainilla, por lo tanto queremos un universo ideal.  
Enviamos a la cola

```bash
carlos@carlos-desktop:~/p $ condor_submit contador.submitfile
Submitting job(s).
1 job(s) submitted to cluster 23.
```

Monitoreamos su ejecución revisando la cola de tareas

```bash
carlos@carlos-desktop:~/p$ condor_q
-- Schedd: carlos-desktop : <192.168.1.10:63014?...
 ID      OWNER            SUBMITTED     RUN_TIME ST PRI SIZE CMD               
  23.0   carlos         10/14 08:23   0+00:00:00 I  0   3.4  python contador.py
1 jobs; 0 completed, 0 removed, 1 idle, 0 running, 0 held, 0 suspended
```

> Les mentí, dije que procesariamos un gran número de libros pero solo lo hicimos para uno. Aquí esta el cambio solución:

```bash
carlosc@carlosc-cluster:~ $ cat verdadero.submit
universe                = vanilla
executable              = python
arguments               = contador.py $(libro)
should_transfer_files   = YES
transfer_input_files    = contador.py, $(libro)
when_to_transfer_output = ON_EXIT
output                  = out.$(Process)
error                   = err.$(Process)
log                     = log.$(Process)

queue libro matching files ./*.txt
```

## El contenedor

Después de haber contando todas y cada una de las palabras de cada libro, queremos ahora hallar la frecuencia de una palabra en el grupo, así, si buscamos la palabra "love", podríamos darnos cuenta que tres de los doscientos libros la incluyen 54, 37 y 22 veces respectivamente.

Optamos por usar R para reunir los resultados en un gráfico. Afirmamos con vehemencia “ya que python está en el cluster, R también debe estar” pero la verdad es que no lo está, debemos ‘instalarlo’ por nuestra cuenta. [ver cómo instalar software]().

Usaremos docker… es como si descargaras el instalador para tu programa… puedes buscar en dockerhub...

Descargamos el contenedor oficial para R en nuestro computador

```
carlos@carlos-desktop:~/p $ docker pull r-base
```

Empezamos a jugar con él situándonos en la carpeta del proyecto de nuestro computador

```
carlos@carlos-desktop:~/p $ docker run -it --rm -v $(pwd):/tmp r-base /bin/bash
root@faef3835d59c:/          # cd /tmp
root@faef3835d59c:/tmp    # ls
   contador.py  contador.submitfile  err.0  log.0    out  pg7849.txt
```
Creamos un pequeño programa que imprime hola mundo
```
root@faef3835d59c:/tmp# echo 'print ("Hola Mundo")' > hola.R
root@faef3835d59c:/tmp# Rscript hola.R
 [1] "Hola Mundo"
```
> Nos salimos haciendo “Ctrl p+q” (si, presiona control control junto con p y q)
> Podes ver los cambios en la carpeta

Ahora que nos sentimos cómodos con el contenedor, vamos a ordenar y graficar las palabras mas frecuentes entre todos los libros. Abrimos nuestro editor de confianza (R-Studio o nano)

```
rooot@kkk:/ # nano r_plotter.R
# Recibe el directorio donde se encuentran los archivos
# y la palabra a buscar
uvsearch = function(directorio, palabra){
   # Saca una lista archivos presentes en el directorio
   libros = list.files(path=directorio, full.names=TRUE,pattern="*.csv")
   Reduce(function(resultados,libro){
     # Lee cada archivo como un csv, cuya primera columna es palabra seguida de frecuencia
     frecuencias = read.csv(file=libro, header=FALSE, stringsAsFactors = FALSE, quote = "", col.names=c("palabra","frecuencia"), encoding="UTF-8")
     # Busca la posicion de palabra en el dataframe de frecuencias
     linea = which(frecuencias$palabra == palabra)
     # Si la encontro...
     if(length(linea) > 0 && linea > 0){
       # Agregua el nombre del libro + frecuencia
       #resultados<- c(resultados, libro, strtoi(frecuencias[linea,]$frecuencia))
       resultados <- rbind(resultados, data.frame(libro=libro, frecuencia=strtoi(frecuencias[linea,]$frecuencia)))
     }
   }, libros, data.frame(libro=list(), frecuencia=list()))
}
poseedores <- uvsearch("out","love")
poseedores <- poseedores[order(poseedores$frecuencia, decreasing=FALSE),]
poseedores <- poseedores[seq(from=1, to=min(5, length(poseedores)+1), by=1),]
if(!is.null(poseedores) && row(poseedores) > 0){
  png('grafico.png')
  plot(poseedores, type = "h")
  dev.off()
}
```

Lo probamos con pocos datos para comprobar que no tiene errores de sintaxis o quizás semánticos:

> Debes tener la carpeta ‘out’ generada en le punto anterior

```
root@faef3835d59c:/tmp $ ls
   contador.py  contador.submitfile  out  pg7849.txt r_plotter.R
...:/ $ Rscript r_plotter.R
```

Y ya podemos ver esa hermosa gráfica. Como es costumbre, (Ahora estamos en el cluster), vamos a crear un submitfile para automatizar este proceso:

```
carlosc@carlosc-cluster:~ $ cat r_plotter.submitfile
universe                          = docker
docker_image                      = r-base
executable                        = Rscript
transfer_executable          = false
arguments                         = r_plotter.R
should_transfer_files        = YES
transfer_input_files                = out, r_plotter.R
transfer_output_files           = grafico.png
when_to_transfer_output   = ON_EXIT
output                              = out.$(Process)
error                               = err.$(Process)
log                                 = log.$(Process)
queue 1
```

HTCondor… Docker (curso rápido)
Lo enviamos para que ejecute...

```
carlosc@carlosc-cluster:~ $ condor_submit contador.submitfile
```

Podemos ver si efectivamente descargó

```
carlosc@carlosc-cluster:~ $ condor_q # constrain para verlo
```

El estado de la tarea es I… luego R… depronto desaparece

Luego vemos como la imagen aparece en la carpeta

La importamos a nuestro pc… y la vemos

```
   --------------
   |   Frec.py  | 
   | libro1.txt |
   |  out/out1  |
   --------------
  /              \      ---------------
 /                \     |  Ploter.R   |
o       * * *      -----|    out/     |
 \                /     | grafico.png |
  \              /      ---------------
   --------------
   |   Frec.py  | 
   | libroN.txt |
   |  out/out1  |
   --------------
```
