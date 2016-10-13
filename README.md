Uvclúster wiki
=========

![](http://compras.univalle.edu.co/imagenes/fotos/banner-estrategia-1.jpg)

Se trata del compendio sobre el conocimiento y uso del clúster computacional de la Universidad del Valle, ubicada en Cali - Colombia. Con ella pretendemos 
guiar a los nuevos usuarios, fomentar el buen uso y las buenas prácticas de los existentes y contribuir al conocimiento de los administradores de clústers.

> Invitamos a los nuevos usuarios a revisar con especial atención el contenido sobre la "Forma de trabajo"

### [Introducción](Introduccion/README.md)
Sobre las cuestiones administraticas del cluster.
 - ¿Quienes somos?
 - ¿Qué es un clúster?
 - ¿Con qué contamos?
 - ¿Cómo obtener ayuda?
 - ¿Por qué alguien usaría un clúster?
 - ¿Qué problemas podría resolver?
 - ¿Cual es la diferencia entre HPC vs HTC?

### [Acceso](Acceso/README.md)
Sobre el acceso al cluster y sus recursos
 - ¿Cómo realizar una solicitud para obtener las creedenciales de acceso?
 - Con las credenciales, ¿cómo se accede al clúster?
 - ¿Cómo enviar archivos? SFTP, SCP

### [Definiciones](Definiciones/README.md)
Sobre la terminología en esta wiki
 - HTCondor
 - Docker
 - Ubuntu-Linux
 - SSH
 - Git

### [Forma de trabajo](FormaDeTrabajo/README.md)
Sobre como pensamos que se podria usar el cluster
 - General
 - Orquestación de contenedores (Docker Swarm, K8s)
 - Excepciones

### [Casos](Casos/README.md)
Ejemplos prácticos y útiles
 - Touch (Básico)
 - Matlab
 - Octave
 - R
 - Mathematica
 - Julia

### [How To](HowTos/README.md)
Guias
 - :star: ¿Cómo hago una replica del clúster en mi computador?
 - :star: ¿Cómo puedo instalar un software en particular en el cluster?
 - :star: ¿Cómo creo una imagen de docker a partir de un contenedor?
 - :star: ¿Cómo envío mi imagen al repositorio del clúster?
 - :star: ¿Cómo publico una imagen de docker en dockerhub? dockerhub, docker push
 - :star: Sin usar git ¿Cómo mantengo actualizada la misma carpeta en mi pc y en el cluster? 
 - :star: :star: ¿Cómo creo una imagen de docker usando un Dockerfile?
 - :star: :star: Mis trabajos dependen entre sí, ¿cómo puedo organizarlos? Dagman, Swift, Pegasus
 - :star: :star: :star: ¿Cómo publico automáticamente una imagen de docker en dockerhub?

### [Debugging y problemas](Problemas/README.md)
Soluciones a problemas y preguntas frecuentes
 - El estado de mi trabajo es 'H'
 - Cómo reanudar un job

### [Cheat Sheet - Cursos rápidos](HowTos/README.md)
Compendios de comandos, trucos y datos
 - Linux
 - Nano
 - HTCondor
 - HTCondor-Submitfiles
 - Docker
 - Git

### [Herramientas](Herramientas/README.md)
Guias sobre herramientas instaladas en el cluster
 - Dagman
 - Swift
 - Pegasus

### [Otros](Otros/README.md)
 - Interactivos

### Notas
Esta documentación puede ser seguida y generada en el clúster usando un [Lynx](http://lynx.browser.org/), [pandoc](http://pandoc.org/demos.html) y Makefile
```
make && lynx index.html
```
### A considerar
 - Incentivar el uso de Git y github
 - Organizar la wiki de tal manera que la dificultadad sea gradual: iniciando con los motivadores

## Responsables
[LASCILAB](http://lascilab.univalle.edu.co/)
> Invitamos a los responsables a revisar el progreso de cada documento [aquí](ESTADO.md)
