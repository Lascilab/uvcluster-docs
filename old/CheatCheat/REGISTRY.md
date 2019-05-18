#DOCKER_REGISTRY

## Registry y Repositorio

Un repositorio de Docker es un lugar que almacena una colección de imagenes, las cuales son usadas para crear un sistema de ficheros para un contenedor.

Un Registry es un servidor que almacena repositorio y provee una API HTTP [para subir, descargar, editar y eliminar repositorios](https://docs.docker.com/userguide/dockerrepos/).

Docker tiene un registry, es público y en él se almacena una gran cantidad de repositorios y es agregado a su instalación por defecto [index](https://hub.docker.com/).

* [`docker login`](https://docs.docker.com/reference/commandline/login) para loguearse en el registry.
* [`docker logout`](https://docs.docker.com/reference/commandline/logout) para desloguearse del registry.
* [`docker search`](https://docs.docker.com/reference/commandline/search) para buscar en el registry por una imagen.
* [`docker pull`](https://docs.docker.com/reference/commandline/pull) descarga una imagen al registry local.
* [`docker push`](https://docs.docker.com/reference/commandline/push) envia una imagen al registry desde el pc actual.

### Usando el registry del cluster
Si la imagen es muy grande o bien no quiere hacer pública su imagen de Docker, sugerimos...

## Configurando el DockerDaemon
A continuación se muestra cómo configurar el demonio de Docker en su pc para enviar imagenes a nuestro registry

### Explorando el registry del cluster
Puede ver las imagenes almacenadas en el registri visitando la [página](http://lascilab.univalle.edu.co/registry)

> Tomado de [](https://github.com/wsargent/docker-cheat-sheet)
