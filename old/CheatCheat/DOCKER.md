#DOCKER

> Tomado de [este repositorio](https://github.com/wsargent/docker-cheat-sheet)

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

Cargar una imagen usando el comando `load` crea una nueva imagen incluyendo su historial.
Importar un contenedor como si fuera una imagen usando el comando `import` crea una nueva imagen excluyendo el historial resultando en una imagen con un peso menor.

## Layers

El sistema de ficheros de una imagen o un contenedor esta basado en capas. Se asemejan a los [git commits](https://docs.docker.com/engine/userguide/storagedriver/imagesandcontainers/).

## Tips

Sources:

* [15 Docker Tips in 5 minutes](http://sssslide.com/speakerdeck.com/bmorearty/15-docker-tips-in-5-minutes)

### Ultimos Ids

```
alias dl='docker ps -l -q'
docker run ubuntu echo hello world
docker commit $(dl) helloworld
```

### Obtener la dirección IP

```
docker inspect $(dl) | grep IPAddress | cut -d '"' -f 4
```
o usando una plantilla de [go-lang](https://docs.docker.com/reference/commandline/inspect)

```
docker inspect -f '{{ .NetworkSettings.IPAddress }}' <nombre_del_contenedor>
```

### Obtener los puertos expuestos

```
docker inspect -f '{{range $p, $conf := .NetworkSettings.Ports}} {{$p}} -> {{(index $conf 0).HostPort}} {{end}}' <nombre_del_contenedor>
```

### Encontrar contenedores según una expresión regular

```
for i in $(docker ps -a | grep "REGEXP_PATTERN" | cut -f1 -d" "); do echo $i; done
```

### Imprimir el ambiente de un contenenedor

```
docker run --rm ubuntu env
```

### Eliminar todos los contenedores

```
docker kill $(docker ps -q)
```

### Eliminar contenedores muy viejos

```
docker ps -a | grep 'weeks ago' | awk '{print $1}' | xargs docker rm
```

### Eliminar contenedores detenidos

```
docker rm -v $(docker ps -a -q -f status=exited)
```

### Eliminar todas las imagenes

```
docker rmi $(docker images -q)
```
