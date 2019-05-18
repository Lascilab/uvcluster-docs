# ¿Cómo creo una imagen de docker? Dockerfile (R por paquetes, Matlab)
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

# ¿Cómo creo una imagen de docker? Docker commit (R por paquetes)

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
