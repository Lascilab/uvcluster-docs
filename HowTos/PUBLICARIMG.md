# ¿Cómo publico una imagen de docker? dockerhub git
> Tiene como ventaja que cualquier cambio al repositorio, la imagen se actualiza
 - Debes crear un repositorio de Git en Github..
 - Debes crear una cuenta en DockerHub
 - Debes crear un repositorio en DockerHub con Automatic Builds a Github
[guia GIT](../CheatCheat/GIT.md)

# ¿Cómo publico una imagen de docker? dockerhub, docker push
> Tiene como ventaja que cualquier cambio al repositorio, la imagen se actualiza
> Pero, a diferencia del anterior, la imagen debe subirse explicitamente 
 - Debes crear una cuenta en DockerHub
 - Debes crear un repositorio en DockerHub (?)
 - Debes logearte en tu computador con las creedenciales de Dockerhub
> docker login
 - Ubica la imagen y enviala
> docker push <autor>/<nombreImagen>:<version>
