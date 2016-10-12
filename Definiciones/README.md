#Definiciones

##HTCondor
HTCondor es una plataforma para HTC que permite el envío de lotes de trabajos siguiendo un esquema de planificación de ejecución de tareas oportunista. Esta plataforma se caracteriza por soportar la ejecución de miles de unidades de trabajo por parte de diferentes usuarios exhibiendo capacidades de tolerancia a fallos. Un proyecto concebido en la Universidad de Wisconsin-Madison en el año 1988 y que ha sido usado en grandes proyectos de investigación a escala global como el LHC.

### Job
Un Job en HTCondor es la ejecución de un programa. Estos normalmente pueden ser detallados por el usuario en un archivo denominado ‘Submit File’.

### Universo
Un universo en HTCondor es un plan de ejecución para un job. Si por ejemplo tratamos de ejecutar una aplicación de java la cual necesita una máquina virtual, entonces se le indica a condor que el universo será Java. Si por el contrario es un programa que no necesita consideraciones especiales, el universo más apropiado sería el ‘Vainilla’ (porque ese sabor combina con cualquier otro :P). En esta guía detallamos el universo Docker.

### Universo Docker
 - No es más que un job del universo Vainilla
 - Es necesario especificar la imagen del contenedor a ejecutar
 - Es necesario especificar los ficheros/carpetas de entrada/salida (si no se encuentra en el contenedor)
Uno de los beneficios de usar  docker está relacionado con el aislamiento de los recursos que el Job vaya a usar (aunque no es equiparable con el de una máquina virtual)
 - Si la imagen no se encuentra en nodo, condor la descargará.

### Submitfile
Es un archivo que indica a HTCondor los parametros con los que se debe ejecutarse un programa.

##Docker
Un manejador para la ejecución de contenedores.

### Imagen
Una imagen es una colección de cambios en el sistema tal y como si copiaran el sistema de ficheros de su computador y lo llevaran comprimido a cualquier otro lugar.

### Contenedor
Un contenedor es una instancia en ejecución de una imagen.

### Volumen
Un volumen es una carpeta visible y compartida en el sistema de ficheros de dos entidades (un contenedor y otro contenedor, un contenedor y el computador donde se ejecuta dicho contenedor, etc)

### Registry
Un Registry es un compendio ordenado y accesible de imágenes.

##Ubuntu-Linux
Una distribución de Linux...

##SSH
Un protocolo

##SCP
Un protocolo

##Git

### Repositorio

### Commit
