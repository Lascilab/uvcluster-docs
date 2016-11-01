# Monitoreo y control
Luego de haberle indicado a HTCondor el job que debia ejecutar en el cluster, es deseable tener información sobre el estado del mismo 
para así tomar decisiones.

## Monitoreo
EL monitoreo consiste en obtener con frecuencia, la información acerca del estado del sistema o bien de nuestros jobs.

### Revisar el estado del sistema
Puedes revisar la lísta de nodos disponibles en el cluster haciendo
```
condor_status
```
Pero tambien puedes filtrarlos por aquellos que esten disponibles
```
condor_status -avail
```
No te desalientes si encuentras que no hay nodos disponibles, el gestor se encarga de agendar tus tareas cuando algun job haya finalizado.

### Revisar el estado de la cola
El estado de la cola de jobs puede ser consultado [usando](https://research.cs.wisc.edu/htcondor/manual/latest/condor_q.html)
```
condor_q
```
Por defecto este comando imprime el ID de la tarea (clusterID.processID), el dueño, el tiempo cuando lo enviaron, el tiempo que lleva ejecutandose, el estado, la prioridad, el tamaño y por último el comando ejecutado. A continución se muestra cada estado y su explicación.

|Estado | .  | Significado |
|--------------------------|
| I  | idle | Esperanndo un nodo para empezar su ejecución|
| R  | running| Corriendo |
| H  | on hold | Ocurrio un error entonces espera una acción del usuario (control)|
| S  | suspended | . |
| C  | completed | . |
| X  | removed   | . |
| <: | - | Transfiriendo datos de entrada |
| \>: | - | Transfiriendo datos de salida |

### Revisar el estado de un job
 - Para revisar el estado de un solo job basta con ejecutar el comando donde muestra todos los jobs para el usuario `<usuario>` en el cluster
```
condor_q -global -submitter <usuario>
```

 - Analiza un job específico mostrando las razones por las cuales se encuntra en dicho estado (Condiciones insatisfechas, no haber sido considerado por el Celestino)

```
condor_q -analyze <job_id>
```
 - Similar al anterior pero con mas información
```
condor_q -better-analyze <job_id>
```
 - Muestra toda la información relacionada al job
```
condor_q -long <job_id>
```

### Revisar los jobs que se encuentran detenidos
A veces es deseable saber sobre los jobs cuyo estado es 'Hold' y la razón por la cual estan así. Por lo general, basta con ejecutar el comando `condor_release` para solucionar el problema (ver abajo)

```
condor_q -hold
```

### Revisar el stdout, stderr y archivos generados de un job en ejecución
 - Puedes ver las últimas líneas del stdout de un job en ejecución
```
condor_tail <job_id>
```

 - Ver de forma incontinua el stdout del comando anterior (sales con Ctrl+C)
```
condor_tail -f <job_id>
```

 - Muestra el contenido del stderr en vez del stdout
```
condor_tail -no-stdout -stderr <job_id>
```

 - Muestra el contenido de un archivo (el `output_file` debe haberse listado en la entrada `transfer_output_files` del submitfile).
```
condor_tail -no-stdout <job_id> <output_file>
```

### Hacer ssh a un job en particular
https://research.cs.wisc.edu/htcondor/manual/v7.8/condor_ssh_to_job.html
```
condor_ssh_to_job <job_id>
```

### Revisar el log de un usuario
```
condor_userlog
```
### Revisar el log de un job
```
condor_logview <file.log>
```
### Revisar la prioridad
```
condor_userprio
```
### Revisar el historial
[](https://research.cs.wisc.edu/htcondor/manual/latest/condor_history.html)
```
condor_history:
```
## Control
Luego de tener información precisa sobre el estado de nuestros jobs, podremos llevar a cabo acciones sobre los mismos de acuerdo a nuestras necesidades

### Pausar un job
[](https://research.cs.wisc.edu/htcondor/manual/v7.8/condor_hold.html)
```
$ condor_suspend
$ condor_hold
```

### Reaunudar un job
[](https://research.cs.wisc.edu/htcondor/manual/v7.8/condor_continue.html)
https://research.cs.wisc.edu/htcondor/manual/v7.8/condor_release.html
```
$ condor_continue <job_id> 
$ condor_release <job_id>
```
### Eliminar un job
https://research.cs.wisc.edu/htcondor/manual/v7.8/condor_rm.html
```
$ condor_rm <cluster ID>[.<process ID>] -name <schedd_string>
```
### Editar un job que esta pendiente en la cola
https://research.cs.wisc.edu/htcondor/manual/v7.8/condor_qedit.html
```
$ condor_qedit
```
