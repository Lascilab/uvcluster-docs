# Matlab, Htcondor y Docker

|Software | Versiones|
|-----------------|
|HTCondor | 8.4|
|Docker Engine | 1.12|
|Ubuntu | 14.04|
|MCR | {2012..2016}(a,b)|

HTCondor está preparado para ejecutar un gran número de aplicaciones de matlab de manera concurrente en un cluster computacional. Si la aplicación contiene el mismo análisis para un conjunto de datos o ejecuta la misma computación para diferentes valores iniciales (como por ejemplo aplicaciones de los métodos de montecarlo), HTCondor puede reducir significativamente el tiempo necesario para obtener dichos resultados porque se encarga de agendar la ejecución del programa en diferentes hosts aprovechando los recursos.

Pero quizás el obstáculo más grande para ejecutar Matlab en HTCondor se centra en el tema de las licencias porque Matlab es una software propietario con términos de licenciamiento restrictivos. Quizás la forma mas usual de crear una aplicación en Matlab consiste en escribir en varios archivos con extensión “.m” las funciones y computaciones que serán ejecutadas por el intérprete de Matlab. Pero esto representa un problema para HTCondor porque cada aplicación que se ejecuta, necesita de una licencia válida de Matlab. Por ello, una solución que se propone en este documento, consiste en compilar estos archivos .m en una aplicación que pueda correr prescindiendo del intérprete de Matlab y por tanto de la licencia que trae consigo este programa pero que, desde luego sea legal.

Como analogía, la solución es equiparable al JDK y JRE de Java: mientras el primero reúne un conjunto de herramientas para el desarrollo de aplicaciones que van desde la compilación del código fuente hasta la creación de applets, el segundo es distribuido a los clientes para que puedan ejecutar dichas aplicaciones.

En suma, este documento describe cómo ejecutar una aplicación de Matlab en un cluster administrado por HTCondor, el cual usa contenedores de Docker. Tiene como ventaja prescindir del uso de una licencia para ejecutar aplicaciones de Matlab pero hacerlo de manera que no infrinja los términos de licencia. 
¿Qué es Matlab?
Es un ambiente multiparadigma para computación numérica. Su código fuente es propietario. 
¿Qué es MCR?
Sus iniciales indican “MATLAB Compiler Runtime”, un conjunto independiente de bibliotecas compartidas que permite la ejecución de aplicaciones o componentes compilados de MATLAB en ordenadores que no tienen instalado MATLAB. 

Cada versión de Matlab trae consigo su respectiva MCR, como se muestra en la siguiente tabla:

|MCR | Matlab |
|-----------------|
|R2016b | (Matlab 9.1)|
|R2015a | (Matlab 8.5)|
|R2013a | (Matlab 8.1)|
|R2016a | (Matlab 9.0.1)|
|R2014b | (Matlab 8.4)|
|R2012b | (Matlab 8.0)|
|R2015b | (Matlab 9.0)|
|R2014a | (Matlab 8.3)|
|R2012a | (Matlab 7.17)|
|R2015aSP1 | (Matlab 8.5.1)|
|R2013b | (Matlab 8.2)|

La diferencia entre Matlab y MCR reside en varios puntos:

El MRC convierte archivos de MATLAB en archivos binarios encriptados e “inmutables”.
MATLAB posee una interfaz gráfica de usuario mientras que el MCR, a pesar que trae consigo todas las funcionalidades de MATLAB, carece de una interfaz gráfica. 
El MCR es usado de acuerdo a la versión de Matlab, así que se deben ejecutar las aplicaciones con el MCR asociado a la versión de compilador usado. Por ejemplo, si la aplicación fue compilada usando la versión 6.3 (R2016b) del compilador de Matlab, los usuarios que quieran ejecutarla deben tener MATLAB o bien MCR version 9.1 instalado.
## Una aplicación como ejemplo
A lo largo de este documento se usará el archivo “mult.m” como ejemplo, este describe la multiplicación de dos matrices cuadradas. Cabe resaltar que las aplicaciones de Matlab deben deben tener una función que coincida con el nombre del archivo, esta función será la función principal o de entrada, además, si la aplicación espera recibir parámetros de entrada, estos ingresan a la función principal como strings.

A grosso modo, una aplicación creada en Matlab para ejecutarse en HTCondor debe seguir los siguientes pasos:

 - Compilar el código fuente de la aplicación
 - Disponer de la imagen del MCR en el cluster
 - Especificar en un submitfile el job que se desea ejecutar 

mult.m
```
function[] = mult
    A = [1 2;3 4]
    B = [5 6;7 8]
    C = A * B
    disp(C)
end
```
## ¿Cómo compilar una aplicación de Matlab?
Existen dos formas de compilar el código fuente de un programa en Matlab, la primera y más simple consiste en utilizar la consola: basta con indicarle al compilador los archivos que constituyen la aplicación. Vale la pena recordar que solo este paso necesita una licencia válida del compilador de Matlab (No del MCR).

> $ mcc -m -R '-logfile,bar.txt,-nojvm,-nodisplay,-singleCompThread -v mult.m
http://es.mathworks.com/help/compiler/mcc.html

Cada argumento tiene su explicación

| Argumento | Explicación |
|-------------------------|
| -nosplash | Desabilita el splash screen.|
| -nodisplay | Lanza la aplicación de Matlab sin funcionalidades de interfaces gráficas|
| -nojvm | Deshabilita la máquina virtual de java(JVM™).|
| -singleCompThread | Deshabilita el uso de mas de un core de CPU |
| -logfile | Escribe información acerca del MCR en un logfile cuando se ejecuta la aplicación |
|-------------------------|

Si una aplicación de Matlab está constituida por varios archivos o bien, el archivo principal hace llamados a funciones almacenadas en otros archivos, sus directorios deberían ser indicados al compilador usando la opción ‘-a’

La segunda forma de compilar una aplicación de Matlab puede llevarse a cabo dentro de la interfaz gráfica del IDE de Matlab

> Menu > Apps > Application Compiler

Ambos métodos crean un archivo binario ejecutable de la aplicación y un script cuyo nombre tiene la forma run_<funcion>.sh el cual es un ejecutable de shell que asigna las variables de entorno y contiene el nombre del ejecutable.

Vale la pena recordar que la compilación no es Cross Platform, así que debe ser realizada usando un sistema operativo Linux de 64 bits (eventualmente MAC).

## ¿Cómo se puede crear una imagen de MCR en Docker?
La imagen del MCR para Docker se construye usando el siguiente Dockerfile:

Dockerfile
```
FROM debian:jessie
MAINTAINER Jacob Söndergaard <jacob@nephics.com>
RUN apt-get update -yq && \
    apt-get install -yq libXmu6 unzip wget
ADD input.txt /mcr-install/input.txt

ENV MATLAB_VER R2016a
RUN cd /mcr-install && \
    wget -nv http://www.mathworks.com/supportfiles/downloads/${MATLAB_VER}/deployment_files/${MATLAB_VER}/installers/glnxa64/MCR_${MATLAB_VER}_glnxa64_installer.zip && \
     unzip MCR_${MATLAB_VER}_glnxa64_installer.zip && \
     mkdir /opt/mcr && \
     ./install -inputFile input.txt && \
     cd / && \
     rm -rf mcr-install
```

Donde input.txt es:

```
destinationFolder=/opt/mcr
agreeToLicense=yes
mode=silent
```
Luego, dicha imagen puede ser construida ejecutando el comando

`$ docker build -t matlab:R2016a`

Cabe resaltar que la versión puede ser modificada de acuerdo a la variable de ambiente $MATLAB_VER y que el tag de la imagen debería coincidir con esta.

## ¿Cómo ejecuto la aplicación en el contenedor?
Luego de tener la imagen del MCR, una aplicación compilada de Matlab se puede ejecutar usando un contenedor en la carpeta que la contiene, de esta forma:

`$ docker run -it --rm -v $(pwd):/tmp matlab:R2016a`

Para luego, dentro del contenedor:

`$ ./tmp/run_mult.sh`

## ¿Cómo usarlo con HTCondor?
El archivo de entrada para ejecutar Jobs en HTCondor es un submitfile, en el cual se describen las características del programa a ejecutar, los argumentos y otras variables. La configuración de este archivo para Matlab debe invocar el script de ejecución generado por Matlab, el cual recibe como argumentos el directorio donde se encuentra el MCR y los argumentos intrínsecos a la aplicación de Matlab.

Ademas, para evitar inconvenientes, se asignan dos variables de entorno MCR_CACHE_ROOT y MATLAB_PREFDIR.

condor_file.submit
```
universe                     = docker
docker_image                 = matlab:R2016a
executable                   = ./run_mult.sh
arguments                    = /opt/mcr/v901
should_transfer_files        = YES
transfer_input_files         = mult, run_mult.sh
when_to_transfer_output = ON_EXIT
output                       = out.$(Process)
error                                    = err.$(Process)
log                                      = log.$(Process)
environment                  = MCR_CACHE_ROOT=/tmp/emptydir;MATLAB_PREFDIR=/tmp/emptydir
queue 1
```

## Lista de ejemplos
Este documento trae consigo una carpeta con ejemplos pueden ser ejecutados para mostrar un pequeño rango de funcionalidades provistas por el MCR usando HTCondor, a continuación describimos cada uno en una tabla:

| Nombre | Descripción  |
|-------------|-------------------|
| bublP | Un programa de ingeniería química. |
| hola  | Un script que imprime en consola ‘Hola Mundo’ |
| colorABN | Un script que lee un grupo de imágenes y las convierte a blanco y negro |
| mult | Un script que multiplica dos matrices |
| montecarlopi | Un script que calcula el número PI usando el método de monte-carlos |
| dependencias | Un proyecto cuya función principal depende de dos funciones contenidas en archivos distintos |
| dagman | Una aplicación que usa HTCondor Dagman |

## Consideraciones
###Licencias y HTCondor
- Si la universidad adquiere algunas licencias de Matlab para el cluster, estas deben ser administradas eficientemente usando Currency Limit, una funcionalidad de HTCondor que limita el número de programas ejecutándose simultáneamente en el cluster cumpliendo cierta característica. Dicha funcionalidad puede aplicarse tanto a matlab, como a mathematica, entre otras para no ir en contravía de lo pactado en cada licencia.
### Gráficos en Matlab
Si un programa en Matlab necesita mostrar en la GUI un gráfico, éste puede ser guardado en un disco para su posterior visualización usando la función 

```
x = [2 4 7 2 4 5 2 5 1 4];
bar(x);
saveas(gcf,'Barchart.png')
```

Ó

```
h=figure;
plot(x,y,'-bs','Linewidth',1.4,'Markersize',10);
% ...
saveas(h,name,'fig')
saveas(h,name,'jpg')
```

Ó

```
## saves the current figure to a file using the specified file format, such as
## print('BarPlot','-dpng'). If the file name does not include an extension, then print appends 
## the appropriate one.

print(filename,formattype) 
```


### Parametros de Entrada
Los programas de matlab ‘deberían’ empezar así

```
if isdeployed
    lastN = maxNumCompThreads(1);
    n = str2num(n);
end
```

## Toolkits y Simulink
Matlab posee bibliotecas y frameworks llamados toolkit (simulink https://es.mathworks.com/matlabcentral/newsreader/view_thread/81685 , etc)
Recursos

# Recursos
[1] http://wiki.rac.manchester.ac.uk/community/MatlabWithCondor
[2] https://htcondor-wiki.cs.wisc.edu/index.cgi/wiki?p=HowToRunMatlab
[3] https://www.mathworks.com/support/compilers/R2016a/index.html?sec=glnxa64
[4] http://research.cs.wisc.edu/htcondor/manual/v8.4/3_12Setting_Up.html#SECTION0041215000000000000000
[5] https://spinningmatt.wordpress.com/2011/06/27/concurrency-limits-protecting-shared-resources/
[6] http://sysadminhelp.cms.caltech.edu/AOK/HTC/


