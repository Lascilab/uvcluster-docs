# General
Esta metodología de trabajo desdibuja el límite sobre los programas que pueden ser ejecutados en el cluster pero, a  su vez, aumenta la complejidad y el número de tareas que debe realizar un usuario para llevar a cabo sus computaciones.

Inicialmente un usuario tiene un problema y desea resolverlo a través de una o varias ideas, las cuales se encuentran implementadas en programas de computadoras. Para ello, instala los programas, indica los datos de entrada, ejecuta los programas y obtiene algunos resultados. 

Este flujo de trabajo se vuelve impráctico a la hora de aplicarse en al cluster computacional porque exige que cada programa se encuentre instalado y configurado en cada máquina, por ello, presentamos como solución Docker...

La modificación consiste en crear, usar o editar una imagen en la que se encuentren las herramientas, librerías y paquetes necesarios para la ejecución de su aplicación.

La última modificación tiene como finalidad indicarle al gestor del cluster (HTCondor) cómo ejecutar las aplicaciones...

(Opcional) Un paso adicional  se centra en declarar las relaciones de los Jobs, es decir. 

# Excepciones
Naturalmente, esta forma de trabajo puede ser la menos indicada para su proyecto, por eso estamos atentos a cualquier sugerencia o [solicitud](solicitudes.md). 
