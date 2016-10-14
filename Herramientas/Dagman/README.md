# Dagman
Se trata de un meta agendador para HTCondor, el cual se encarga de manejar
las dependencias entre los Jobs en alto nivel. Dichas dependencias pueden ser
por datos, lógicas o simplemente una manera de ordenarlos.

Su prefijo hace referencia a un gráfo aciclico directo (DAG), es decir, una 
forma de representar un conjunto de programas mostrando sus dependencias e impidiendo
que un ciclo. 

## Un ejemplo
En la mañana antes de ir a la universidad una persona realiza una serie de actividades
secuenciales: se despierta, se levanta, va a la cocina a preparar el cafe, entra a la ducha mientras se cepilla, para luego secarse y vestirse.

Estas actividades pueden ser modeladas usando un DAG, como se muestra a continuación

```
                     /-> ducharse   \
(levantar) -> (cafe)                 -> secarse -> vestirse
                     \-> cepillarse /
```

¿qué sucedería si este proceso tuviese un ciclo? Luego de vestirse, levantarse de nuevo
no es una opción, debemos ir a la universidad. 

## Uso
Teniendo los [submitfiles](../) que describen cada actividad del workflow (una serie de
actividades se les denomina así), basta con nombrar en otro archivo llamado `dagman.dag`
las dependencias y las actividades:

```
#base.tmpl
universe = vanilla
executable = /bin/echo
ID      = $(Cluster).$(Process)
output  = $(ID).out
error   = $(ID).err
log     = $(Cluster).log
```

```
#levantar.submit
include : base.tmpl
arguments = "*Bosteza*"
```

```
#cafe.submit
include : base.tmpl
arguments = "*Abre sus ojos*"
```

```
#ducharse.submit
include : base.tmpl
arguments = "*Siente el mar*"
```

```
#cepillarse.submit
include : base.tmpl
arguments = "*Se asea*"
```

```
#secarse.submit
include : base.tmpl
arguments = "*Se siente limpio*"
```

```
#vestirse.submit
include : base.tmpl
arguments = "*Cubre su desnudez*"
```

Para luego definir el anhelado submitfile

```
JOB levantar levantar.submit
JOB cafe cafe.submit
JOB ducharse ducharse.submit
JOB cepillarse cepillarse.submit
JOB secarse secarse.submit
JOB vestirse vestirse.submit

PARENT levantar CHILD cafe
PARENT cafe CHILD ducharse
PARENT ducharse, cepillarse CHILD secarse
PARENT secarse CHILD vestirse
```

Podemos enviar este dag a la cola haciendo

```
$ condor_submit_dag dagman.dag
```
Y luego verlo en ejecución
```
$ condor_q
```
Para ver una descripción mas detallada de un dagfile [visitar](http://research.cs.wisc.edu/htcondor/manual/latest/2_10DAGMan_Applications.html)

## Ejemplos
Esta sección contiene tambien otros casos mas detallados al respecto

|Ejemplo|descripción|
|------|------|
|[haskell](haskell/README.md)|Se trata del workflow para la creación de un pequeño lenguaje de programación|
|[mathematica](mathematica/README.md)| Se trata de la creación de un gif sobre el fractal de mandelbrot|
|[matlab](matlab/README.md)|Se trata de la multiplicación concurrente de matrices 2x2|
|[octave](octave/README.md)|Se trata de la creación de un gif sobre el fractal de mandelbrot| 

## Recursos
https://raw.githubusercontent.com/OSGConnect/tutorial-dagman-namd/master/README.md
