#DOCKER

> Tomado de [](https://github.com/wsargent/docker-cheat-sheet)

## Instalación

### Linux

La forma mas fácil de instalar Docker es ejecutando este comandor:

```
curl -sSL https://get.docker.com/ | sh
```

Si no funciona, entonces sugerimos usar [instalacion](https://docs.docker.com/installation/) siguiendo las indicaciones para su distribución.

Si eres nuevo en Docker deberias revisar este link [Serie de tutoriales](https://docs.docker.com/linux/started/).

Luego ejecute su primer contenedor:

```
docker run hello-world
```

Simple, ya tiene un contenedor de docker ejecutandose en su computador

## Contenedores

[Un proceso aislado](http://etherealmind.com/basics-docker-containers-hypervisors-coreos/). Los contenedores son a las Máquinas virtuales como los hilos a los procesos. O tambien puede pensarlos como Chroots con esteroides.

### Lifecycle

* [`docker create`](https://docs.docker.com/reference/commandline/create) crea un contenedor pero no lo inicia.
* [`docker rename`](https://docs.docker.com/engine/reference/commandline/rename/) permite renombrar un contenedor.
* [`docker run`](https://docs.docker.com/reference/commandline/run) crea e inicia un contenedor en una operación.
* [`docker rm`](https://docs.docker.com/reference/commandline/rm) elimina un contendor.
* [`docker update`](https://docs.docker.com/engine/reference/commandline/update/) actualiza los límites de recursos impuestos a un contendor.

Si quiere un contendor efimero, `docker run --rm` removerá el contenedor una vez se salga de él.

Si quiere compartir un directorio entre su máquina y el contenedor, `docker run -v $HOSTDIR:$DOCKERDIR`.  Vea tambien el concepto de [Volumenes](https://github.com/wsargent/docker-cheat-sheet/#volumes).

Si tambien quiere remover los volumenes asociados al contenedor, el comando debe incluir la opción -v `docker rm -v`.

### Iniciando y deteniendo

* [`docker start`](https://docs.docker.com/reference/commandline/start) inicia a un contenedor
* [`docker stop`](https://docs.docker.com/reference/commandline/stop) detiene a un contenedor.
* [`docker restart`](https://docs.docker.com/reference/commandline/restart) detiene y luego inicia un contenedor.
* [`docker pause`](https://docs.docker.com/engine/reference/commandline/pause/) pausa un contenedor en marcha.
* [`docker unpause`](https://docs.docker.com/engine/reference/commandline/unpause/) reanuda la ejecución de un contenedor en pausa.
* [`docker wait`](https://docs.docker.com/reference/commandline/wait) bloquea la terminal hasta que un contendor se detenga.
* [`docker kill`](https://docs.docker.com/reference/commandline/kill) envia una SIGKILL a un contendor en ejecución.
* [`docker attach`](https://docs.docker.com/reference/commandline/attach) se conecta a un contenedor en ejecución.

### Información

* [`docker ps`](https://docs.docker.com/reference/commandline/ps) muestra los contendores ejecutandose.
* [`docker logs`](https://docs.docker.com/reference/commandline/logs) Muestra el log de un contenedor.
* [`docker inspect`](https://docs.docker.com/reference/commandline/inspect) Muestra toda la información disponible de un contenedor (dirección IP, puertos abiertos).
* [`docker events`](https://docs.docker.com/reference/commandline/events) muestra los eventos de un contenedor.
* [`docker port`](https://docs.docker.com/reference/commandline/port) lista los puertos abiertos de un contenedor.
* [`docker top`](https://docs.docker.com/reference/commandline/top) muestra los procesos ejecutandose en un contenedor.
* [`docker stats`](https://docs.docker.com/reference/commandline/stats) muestra las estaditicas de uso de un contenedor.
* [`docker diff`](https://docs.docker.com/reference/commandline/diff) muestra los archivos modificados dentro del contenedor.

`docker ps -a` muestra tanto los contendores ejecutandose como los detenidos.

`docker stats --all` lista los contenedores ejecutadose.

### Importar / Exportar

* [`docker cp`](https://docs.docker.com/reference/commandline/cp) copia archivos o carpetas entre el contendor y el sistema de archivos
* [`docker export`](https://docs.docker.com/reference/commandline/export) Convierte el sistema de ficheros de un contenedor en un tar que sale a STDOUT.

### Ejecutando Comandos

* [`docker exec`](https://docs.docker.com/reference/commandline/exec) ejecuta un comando en un contenedor.

Para entrar a un contenedor 'foo' en ejecución, añada una terminal: `docker exec -it foo /bin/bash`.

## Imagenes

Las imagenes pueden verse como [plantillas para los contendores de Docker](https://docs.docker.com/engine/understanding-docker/#how-does-a-docker-image-work).

### Ciclo de vida de las imagenes

* [`docker images`](https://docs.docker.com/reference/commandline/images) muestras las imagenes disponibles.
* [`docker import`](https://docs.docker.com/reference/commandline/import) crea una imagen desde un tar.
* [`docker build`](https://docs.docker.com/reference/commandline/build) crea una imagen desde un Dockerfile.
* [`docker commit`](https://docs.docker.com/reference/commandline/commit) crea una imagen desde un contenedor pausando temporalmente su ejecución.
* [`docker rmi`](https://docs.docker.com/reference/commandline/rmi) remueve una imagem.
* [`docker load`](https://docs.docker.com/reference/commandline/load) carga una imagen desde el STDIN (debe ser un flujo de tar).
* [`docker save`](https://docs.docker.com/reference/commandline/save) guarda una imagen en un tar STDOUT con todas las capas, tags y versiones.

### Información de las imagenes

* [`docker history`](https://docs.docker.com/reference/commandline/history) muestra la historia de una imagen (cada capa y su acción).
* [`docker tag`](https://docs.docker.com/reference/commandline/tag) asigna un tag a una imagen.

### Eliminando imagenes

Puede usar el comando `docker rmi` para eliminar una imagen.

### Cargando y guardando imagenes

Para cargar una imagen de un archivo puede usar:
```
docker load < my_image.tar.gz
```

Guardando una imagen existente:
```
docker save my_image:my_tag > my_image.tar.gz
```

### Importando/Exportando un contenedor

Para importar un contenedor como una imagen desde un archivo:
```
cat my_container.tar.gz | docker import - my_image:my_tag
```

Exportando un contenedor existente:
```
docker export my_container > my_container.tar.gz
```

### Difference between loading a saved image and importing an exported container as an image ?

Loading an image using the `load` command creates a new image including its history.  
Importing a container as an image using the `import` command creates a new image excluding the history which results in a smaller image size compared to loading an image.


## Layers

The versioned filesystem in Docker is based on layers.  They're like [git commits or changesets for filesystems](https://docs.docker.com/engine/userguide/storagedriver/imagesandcontainers/).

Note that if you're using [aufs](https://en.wikipedia.org/wiki/Aufs) as your filesystem, Docker does not always remove data volumes containers layers when you delete a container!  See [PR 8484](https://github.com/docker/docker/pull/8484) for more details.


## Volumes

Docker volumes are [free-floating filesystems](https://docs.docker.com/userguide/dockervolumes/).  They don't have to be connected to a particular container.  You should use volumes mounted from [data-only containers](https://medium.com/@ramangupta/why-docker-data-containers-are-good-589b3c6c749e) for portability.  

### Lifecycle

* [`docker volume create`](https://docs.docker.com/engine/reference/commandline/volume_create/)
* [`docker volume rm`](https://docs.docker.com/engine/reference/commandline/volume_rm/)

### Info

* [`docker volume ls`](https://docs.docker.com/engine/reference/commandline/volume_ls/)
* [`docker volume inspect`](https://docs.docker.com/engine/reference/commandline/volume_inspect/)

Volumes are useful in situations where you can't use links (which are TCP/IP only).  For instance, if you need to have two docker instances communicate by leaving stuff on the filesystem.

You can mount them in several docker containers at once, using `docker run --volumes-from`.

Because volumes are isolated filesystems, they are often used to store state from computations between transient containers.  That is, you can have a stateless and transient container run from a recipe, blow it away, and then have a second instance of the transient container pick up from where the last one left off.

See [advanced volumes](http://crosbymichael.com/advanced-docker-volumes.html) for more details.  Container42 is [also helpful](http://container42.com/2014/11/03/docker-indepth-volumes/).

You can [map MacOS host directories as docker volumes](https://docs.docker.com/userguide/dockervolumes/#mount-a-host-directory-as-a-data-volume):

```
docker run -v /Users/wsargent/myapp/src:/src
```

You can also use remote NFS volumes if you're [feeling brave](https://docs.docker.com/engine/tutorials/dockervolumes/#/mount-a-shared-storage-volume-as-a-data-volume).

You may also consider running data-only containers as described [here](http://container42.com/2013/12/16/persistent-volumes-with-docker-container-as-volume-pattern/) to provide some data portability.

### User Namespaces

There's also work on [user namespaces](https://s3hh.wordpress.com/2013/07/19/creating-and-using-containers-without-privilege/) -- it is in 1.10 but is not enabled by default.

To enable user namespaces ("remap the userns") in Ubuntu 15.10, [follow the blog example](https://raesene.github.io/blog/2016/02/04/Docker-User-Namespaces/).


## Tips

Sources:

* [15 Docker Tips in 5 minutes](http://sssslide.com/speakerdeck.com/bmorearty/15-docker-tips-in-5-minutes)

### Last Ids

```
alias dl='docker ps -l -q'
docker run ubuntu echo hello world
docker commit $(dl) helloworld
```

### Get IP address

```
docker inspect $(dl) | grep IPAddress | cut -d '"' -f 4
```

or install [jq](https://stedolan.github.io/jq/):

```
docker inspect $(dl) | jq -r '.[0].NetworkSettings.IPAddress'
```

or using a [go template](https://docs.docker.com/reference/commandline/inspect)

```
docker inspect -f '{{ .NetworkSettings.IPAddress }}' <container_name>
```

### Get port mapping

```
docker inspect -f '{{range $p, $conf := .NetworkSettings.Ports}} {{$p}} -> {{(index $conf 0).HostPort}} {{end}}' <containername>
```

### Find containers by regular expression

```
for i in $(docker ps -a | grep "REGEXP_PATTERN" | cut -f1 -d" "); do echo $i; done
```

### Get Environment Settings

```
docker run --rm ubuntu env
```

### Kill running containers

```
docker kill $(docker ps -q)
```

### Delete old containers

```
docker ps -a | grep 'weeks ago' | awk '{print $1}' | xargs docker rm
```

### Delete stopped containers

```
docker rm -v $(docker ps -a -q -f status=exited)
```

### Delete dangling images

```
docker rmi $(docker images -q -f dangling=true)
```

### Delete all images

```
docker rmi $(docker images -q)
```

### Slimming down Docker containers  [Intercity Blog](http://bit.ly/1Wwo61N)

- Cleaning APT in a RUN layer
This should be done in the same layer as other apt commands.
Otherwise, the previous layers still persist the original information and your images will still be fat.
```
RUN {apt commands} \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
```
- Flatten an image
```
ID=$(docker run -d image-name /bin/bash)
docker export $ID | docker import – flat-image-name
```

- For backup
```
ID=$(docker run -d image-name /bin/bash)
(docker export $ID | gzip -c > image.tgz)
gzip -dc image.tgz | docker import - flat-image-name
```

### Monitor system resource utilization for running containers

To check the CPU, memory, and network i/o usage of a single container, you can use:

```
docker stats <container>
```

For all containers listed by id:

```
docker stats $(docker ps -q)
```

For all containers listed by name:

```
docker stats $(docker ps --format '{{.Names}}')
```

For all containers listed by image:

```
docker ps -a -f ancestor=ubuntu
```
