## ¿Quienes somos?
*LaScILab* es un laboratorio adscrito a la Escuela de Ingenieria de Sistemas y Computacion (EISC) de la Facultad de Ingenieria de la Universidad del Valle. 
*LaScILab* se deriva del término en inglés **La**rge **Sc**ale **I**nfrastructure **Lab**oratory pues el objetivo del laboratorio es trabajar en términos relacionados a infraestructuras computacionales distribuidas a gran escala. 

Es así como en este laboratorio se trabaja en áreas del conocimiento relacionadas a los sistemas operativos, herramientas de virtualización, orquestación de servicios y plataformas computacionales tipo HTC (*high throughput computing*) y HPC (*high performance computing*).
Dado que el término *LaScILab* puede sonar complejo y demasiado alejado del quehacer de la gente de informática, al interior de la EISC se le conoce también como el **Laboratorio de Redes**.

El laboratorio esta bajo la dirección del profesor John Sanabria quien cuenta con el apoyo de estudiantes de pregrado y postgrado. Estos estudiantes y los temas que se trabajan en el laboratorio se relacionan a continuación:

| Nombre | Programa | Area |
|--------|----------|------|
| Carlos Arango| Est. doctorado | Cambio climático, HTC, virtualización |
| Jhon Caballero | Est. ingeniería de Sistemas | Virtualización y Orquestación de Servicios |
| Carlos Roman | Est. ingeniería de Sistemas | HTC, virtualización, Homepage |
| Aurelio Vivas | Est. ingeniería de Sistemas | Programación en paralelo |
| Edier Zapata | Est. maestría | HTC |

## ¿Con qué infraestructura contamos?

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

## ¿Dudas respecto a lo que ha leído al momento?
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
En este tipo de *cluster* se pueden ejecutar tareas que se conocen como *bag of tasks* o *parameter sweep applications*.
***Bag of tasks*** o bolsa de tareas es un tipo especial de aplicación que se caracteriza por la diversidad de tipos de tareas que requiere la ejecución de este tipo de aplicación. Suponga una aplicación que requiere ejecutar una tarea con múltiples hilos de ejecución, luego ejecutar una tarea distribuida, luego una tarea intensiva en cómputo, etc. 
Es decir, este tipo de aplicaciones se caracteriza por la heterogeneidad del tipo de tareas que requiere para lograr su ejecución.
***Parameter sweep applications*** o aplicaciones de barrido de parámetros son aplicaciones en las cuales se requiere ejecutar una sola aplicación pero muchas veces con diferentes parámetros de entrada. 
Ejemplo de este tipo de aplicaciones son las aplicaciones que usan heurísticas y las cuales se caracterizan por tener resultados no deterministas y por este razón se requiere ejecutar la misma aplicación varias veces con diferentes parámetros para determinar comportamientos o tendencias.
* **¿Con quién me pongo en contacto para resolver dudas?**
Para contactarnos hágalo a través del correo electrónico del laboratorio [Lascilab](mailto:laboratorio.redesysd@correounivalle.edu.co ).
