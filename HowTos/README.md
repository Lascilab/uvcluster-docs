# How To

## ¿Cómo creo una imagen de docker? Dockerfile (R por paquetes, Matlab)
Habiendo instalado Docker en el equipo, abre un editor de texto
```
$ nano Dockerfile
```
Dependiendo de tus necesidades ... referencia a [Dockerfile](../CheatCheat/DOCKERFILE.md)

```
# Nos basamos en la imagen oficial de R
FROM r-base
# Copiamos en la imagen el escript que lista los paquetes de R necesarios
COPY install.R /usr/local/src/myscripts/install.R
WORKDIR /usr/local/src/myscripts
# Instalamos los paquetes de R necesarios para nuestra aplicación en la imagen
RUN Rscript install.R
# Copiamos el contenido de esta carpeta en /usr/local/src/myscripts
COPY . /usr/local/src/myscripts
# Le indicamos a Docker que cuando el contenedor inicie, ejecute nuestro script
CMD ["Rscript", "main.r"]
```

Luego, Docker puede construir la imagen por nosotros, donde <autor> es tu nombre de usuario y <nombreImagen> es el nombre que le quieres dar a la imagen

```
$ docker build -t <autor>/<nombreImagen>:<version> .
```

Sugerimos seguir una [guía](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/) sobre las buenas prácticas a la hora de construir imagenes

## ¿Cómo creo una imagen de docker? Docker commit (R por paquetes)

Puedes iniciar partiendo de un contenedor existente:
```
$ contenedor=docker run -it ubuntu
```
Luego modificas su contenido instalando las aplicaciones necesarias
```
$ apt-get update
$ apt-get install software-properties-common
$ add-apt-repository ppa:staticfloat/juliareleases
$ add-apt-repository ppa:staticfloat/julia-deps
$ apt-get update
$ apt-get install julia
$ rm -rf /var/lib/apt/lists/* && apt-get clean
$ julia -e "2+2"
```
Ya habiendo modificado el contenedor, es mejor salirse (Ctrl-p + Ctrl-q)

```
$ docker commit $contenedor <autor>/<nombreImagen>:<version>
```

Ya cuando quieras puedes usarlo:

```
$ docker run -it <autor>/<nombreImagen>:<version>
```

## ¿Cómo envío mi imagen al repositorio del cluster? (Vista)
> Tiene como ventaja que es un poco mas privado
Primero debes modificar unos paramestros en la instalación de Docker

### Para Ubuntu 14.04

```
$ sudo nano /etc/default/docker
```
Y luego encontrar o añadir la siguiente línea

>DOCKER_OPTS="--insecure-registry <IP_DEL_REGISTRY>:5000"

### Etiquetando y enviando la imagen
Las 
```
docker tag <autor>/<nombreImagen>:<version> <IP_DEL_REGISTRY>:5000/<autor>/<nombreImagen>:<version>
docker push <IP_DEL_REGISTRY>:5000/<autor>/<nombreImagen>:<version>
```
> Puedes confirmar si la imagen se ha almacenado correctamente accediendo a [link](http://<IP_DEL_REGISTRY>:8080/)
o bien
```
$ curl -X GET http://localhost:5000/v2/_catalog | grep <nombreImagen>
```

o bien

```
docker search <IP_DEL_REGISTRY>:5000/<nombreImagen>
```
## ¿Cómo publico una imagen de docker? dockerhub git
> Tiene como ventaja que cualquier cambio al repositorio, la imagen se actualiza
 - Debes crear un repositorio de Git en Github..
 - Debes crear una cuenta en DockerHub
 - Debes crear un repositorio en DockerHub con Automatic Builds a Github
[guia GIT](../CheatCheat/GIT.md)

## ¿Cómo publico una imagen de docker? dockerhub, docker push
> Tiene como ventaja que cualquier cambio al repositorio, la imagen se actualiza
> Pero, a diferencia del anterior, la imagen debe subirse explicitamente 
 - Debes crear una cuenta en DockerHub
 - Debes crear un repositorio en DockerHub (?)
 - Debes logearte en tu computador con las creedenciales de Dockerhub
> docker login
 - Ubica la imagen y enviala
> docker push <autor>/<nombreImagen>:<version>
 

## ¿Cómo hago una replica del cluster en mi computador?

Necesita instalar:

- HTCondor
- Docker

### Centos 7
> Para Centos 6 cambie la url https://research.cs.wisc.edu/htcondor/yum/repo.d/htcondor-stable-rhel6.repo

```
#!/bin/bash
$ cd /etc/yum.repos.d/
$ sudo wget https://research.cs.wisc.edu/htcondor/yum/repo.d/htcondor-stable-rhel7.repo
$ sudo yum install -y epel-release
$ sudo yum install -y condor condor-python nano
$ curl -fsSL https://get.docker.com/ | sudo sh
$ sudo gpasswd -a ${USER} docker
$ sudo gpasswd -a condor docker
$ newgrp docker
$ sudo service docker restart
$ sudo service condor restart

ps -ef | grep condor
condor_reconfig
condor_status -const HasDocker
``

### Ubuntu 14.04
> Para Ubuntu 12.04 cambie la palabra trusty por ‘precise’

```
$ echo "deb [arch=amd64] http://research.cs.wisc.edu/htcondor/ubuntu/stable/ trusty contrib" | sudo tee -a /etc/apt/sources.list
$ echo "deb [arch=amd64] http://research.cs.wisc.edu/htcondor/ubuntu/development/ trusty contrib" | sudo tee -a /etc/apt/sources.list
$ wget -qO - http://research.cs.wisc.edu/htcondor/ubuntu/HTCondor-Release.gpg.key | sudo apt-key add -
$ sudo apt-get update
$ sudo apt-get install -y condor
$ curl -fsSL https://get.docker.com/ | sudo sh
$ sudo gpasswd -a ${USER} docker
$ sudo gpasswd -a condor docker
$ newgrp docker
$ sudo service docker restart
$ sudo service condor restart
```

### Windows

> Si se encuentra en Windows, le sugerimos crear una máquina virtual de Ubuntu o Centos

## ¿Cómo puedo instalar un software en particular en el cluster?
Si en definitiva Docker no es una forma feasible de llevar a cabo sus computaciones, puede contactarse con el encargado del laboratorio.
Algunos casos son:
 - Mathematica
 - MPI
 - Hadoop
 - Entre otros

## Mis trabajos dependen entre sí, ¿cómo puedo organizarlos? Dagman, Swift, Pegasus
Ver Dagman, Swift o Pegasus en (Herramientas)[../Herramientas/README.md]
