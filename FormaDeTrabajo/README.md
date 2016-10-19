# General
Esta metodología de trabajo desdibuja el límite sobre los programas que pueden ser ejecutados en el cluster pero, a  su vez, aumenta la complejidad y el número de tareas que debe realizar un usuario para llevar a cabo sus computaciones.

Inicialmente un usuario tiene un problema y desea resolverlo usando una o varias ideas, las cuales se encuentran implementadas en programas de computadoras. Para ello, instala los programas, indica los datos de entrada, los ejecuta y obtiene algunos resultados. 

Este flujo de trabajo se vuelve impráctico a la hora de aplicarse en cluster computacional porque exige que cada programa se encuentre instalado y configurado manualmente en cada máquina, por ello, presentamos como solución Docker.

Esta herramienta altera la forma ligeramente la forma de trabajo inicial. Dicha modificación consiste en crear, usar o editar una imagen en la que se encuentren instaladas las herramientas, librerías y paquetes necesarios para la ejecución de la aplicación. Adicionalmente, ya que las aplicaciones no pueden ser atendidas por el usuario ya que se demoran mucho o son muchas, se le delega esta tarea a un gestor de tareas llamado HTCondor.

> Justificación: http://nucleotid.es/
> Paper justificación: https://arxiv.org/pdf/1410.0846.pdf

# Docker Swarm o K8s
Es posible que HTCondor no sea una opción adecuada para la solución de su problema por lo que tambien contamos con otra opción llamada [Docker Swarm](https://docs.docker.com/swarm/).

# Excepciones
Naturalmente, cualquiera de estas dos formas de trabajo pueden ser las menos indicadas para su proyecto, por eso estamos atentos a cualquier sugerencia o [solicitud](solicitudes.md).
