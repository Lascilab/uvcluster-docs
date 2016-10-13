# ¿Cómo envío mi imagen al repositorio del cluster? (Vista)
> Tiene como ventaja que es un poco mas privado
Primero debes modificar unos paramestros en la instalación de Docker

## Para Ubuntu 14.04

```
$ sudo nano /etc/default/docker
```
Y luego encontrar o añadir la siguiente línea

>DOCKER_OPTS="--insecure-registry <IP_DEL_REGISTRY>:5000"

## Etiquetando y enviando la imagen
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
