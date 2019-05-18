## ¿Quienes somos?
*LaScILab* es un laboratorio adscrito a la Escuela de Ingenieria de Sistemas y Computacion (EISC) de la Facultad de Ingenieria de la Universidad del Valle. 
*LaScILab* se deriva del término en inglés **La**rge **Sc**ale **I**nfrastructure **Lab**oratory pues el objetivo del laboratorio es trabajar en términos relacionados a infraestructuras computacionales distribuidas a gran escala. 

Es así como en este laboratorio se trabaja en áreas del conocimiento relacionadas a los sistemas operativos, herramientas de virtualización, orquestación de servicios y plataformas computacionales tipo HTC (*high throughput computing*) y HPC (*high performance computing*).
Dado que el término *LaScILab* puede sonar complejo y demasiado alejado del quehacer de la gente de informática, al interior de la EISC se le conoce también como el **Laboratorio de Redes**.

El laboratorio esta bajo la dirección del profesor John Sanabria quien cuenta con el apoyo de estudiantes de pregrado y postgrado. Estos estudiantes y los temas que se trabajan en el laboratorio se relacionan a continuación:

| Nombre | Programa | Area |
|--------|----------|------|
| Carlos Arango | Est. doctorado | Cambio climático, HTC, virtualización |
| Jhon Caballero| Est. ingeniería de Sistemas | Virtualización y Orquestación de Servicios |
| Carlos Roman  | Est. ingeniería de Sistemas | HTC, virtualización, Homepage |
| Aurelio Vivas | Est. ingeniería de Sistemas | Programación en paralelo |
| Edier Zapata  | Est. maestría | HTC |

Para contactarnos enviar un correo a [Lascilab](mailto:laboratorio.redesysd@correounivalle.edu.co ).

## ¿Con qué infraestructura se cuenta?

El laboratorio cuenta fundamentalmente con dos espacios para llevar a cabo procesos relacionados con la docencia y la investigación. 
A nivel de docencia se tiene el espacio 2072 en el edificio 331 de la Facultad de Ingeniería. 
En este espacio se tiene estaciones de trabajo para los colaboradores del laboratorio y en ellas también se llevan a cabo procesos de docencia en áreas relacionados a redes, sistemas operativos y sistemas distribuidos.

El segundo espacio es donde reside el *cluster* computacional que presta servicios a las áreas de postgrado de la Universidad del Valle. 
Este *cluster* cuenta con la siguiente configuración

| Número de núcleos | RAM | Cantidad de Nodos |
|:---:|:---:|:---:|
| 64 | 160 GB | 4 |
| 8 | 16 GB | 8 |

Contamos con un total de 320 *cores* y 768 GB de RAM. Adicionalmente, esta infraestructura cuenta con un almacenamiento externo de cerca de 2.5 TB.

La utilización de estos equipos se hace a través de un sistema de manejo de cola de tareas llamado HTCondor. 
Este sistema se caracteriza por gestionar la ejecución de tareas de diversa naturaleza sobre ambientes heterogéneos de computación basado en políticas oportunistas de asignación de recursos.

## Posibles Dudas respecto a lo que ha leído al momento
A continuación se dan algunas definiciones respecto a dudas que pueda tener respecto al texto que ha leído.

* **¿Qué es un cluster?**
Un *cluster* es un tipo de infraestructura computacional donde varios nodos autónomos (a.k.a. computadores) se integran para tratar de resolver problemas de forma conjunta. 
Un *cluster* se caracteriza por contar por un nodo maestro, un conjunto de nodos de trabajo  y un sistema de almacenamiento compartido o común entre todos los nodos del *cluster*.
Este *cluster* cuenta además con un software que permite a los usuarios del *cluster* enviar un volumen importante de tareas y olvidarse de la ejecución de las mismas, es responsabilidad de este software garantizar la ejecución de las tareas que se le envían a él.
* **¿Qué es HTCondor?**
HTCondor es el software que hemos seleccionado para gestionar la ejecución de las tareas en nuestro *cluster*. 
HTCondor vela porque una vez las tareas son recibidas en el sistema, estas tareas terminen de ser ejecutadas.  
Así mismo HTCondor se diferencia de otro tipo de gestores de cola de tareas de cluster porque se orienta mas hacia HTC que hacia HPC. 
Adicionalmente, para HTCondor es totalmente natural el gestionar diversas plataformas de hardware y software dejando la usuario totalmente inconsciente de la naturaleza heterogénea de la plataforma.
* **¿Qué es HTC?**
HTC viene de *High Throughput Computing*. 
HTC se usa para denotar o plataformas o tipos de ambientes donde lo mas importante a la hora de procesar tareas es maximizar el número de estas que se ejecutan por unidad de tiempo. 
* **¿Qué es HPC?**
HPC es una sigla que se deriva del termino *High Performance Computing*. 
HPC se usa para denotar o plataformas o tipos de ambientes donde lo mas importante es reducir los tiempos de ejecución de las aplicaciones. 
El tipo de infraestructuras computacionales que son adecuadas para este tipo de objetivo son aquellas que se caracterizan por la homogeneidad de los equipos de cómputo tanto en su hardware como en su software.
* **¿Qué tipo de problemas o aplicaciones puedo ejecutar el *cluster* que ustedes gestionan?** 
En este tipo de *cluster* se pueden ejecutar **aplicaciones desatendidas** del tipo 
  * *Bag of tasks* 
  * *Parameter sweep applications* 
  * *Embarrassingly parallel applications*
* **¿Qué son aplicaciones desatendidas?**
Son aplicaciones **desatendidas** aquellas que para poder correr no necesitan de la interacción del usuario para su correcta ejecución. 
Ejemplo de aplicaciones que **si** requieren atención son: Matlab con su entorno gráfico, un procesador de palabras, un navegador. 
Todas estas aplicaciones se caracterizan por requerir **atención** del usuario para lograr hacer su trabajo.
Las aplicaciones desatendidas por otro lado requieren todos los datos de entrada al momento de comenzar su ejecución al pasárseles esos datos como argumentos de la aplicación. 
* **¿Qué son aplicaciones del tipo bag of tasks**? 
*Bag of tasks* o bolsa de tareas es un tipo de aplicación que se caracteriza por la diversidad de tipos de tareas que requiere la ejecución de este tipo de aplicación. 
Suponga una aplicación que requiere ejecutar varias tareas, por ejemplo una tarea con múltiples hilos de ejecución, luego ejecutar una tarea de naturaleza distribuida, luego una tarea intensiva en cómputo, etc. 
Es decir, estas aplicaciones se caracterizan por la heterogeneidad del tipo de tareas que requiere para lograr su ejecución.
* **¿Qué son parameter sweep applications**? 
*Parameter sweep applications* o aplicaciones de barrido de parámetros son aplicaciones en las cuales se requiere ejecutar una sola aplicación muchas veces con diferentes parámetros de entrada. 
* **¿Qué son embarrassingly parallel applications?**
*Embarrassingly parallel applications* son aplicaciones que se pueden particionar en un número arbitrario de subtareas. 
Ejemplo de un aplicación de este tipo, es la de hacer búsquedas en una base de datos por el valor mas alto en un campo de un tabla. 
Una posibilidad es la de correr la aplicación una sola vez sobre toda la base de datos de forma lineal y encontrar el máximo. 
Otra posibilidad es ejecutar varias instancias de la aplicación sobre diferentes partes de la base de datos y que al final se consolide, a partir de los resultados parciales de cada una de las instancias, y determinar entonces el máximo de toda la base de datos.
* **¿Con quién me pongo en contacto para resolver dudas adicionales?**
Para contactarnos hágalo a través del correo electrónico del laboratorio [Lascilab](mailto:laboratorio.redesysd@correounivalle.edu.co ).
