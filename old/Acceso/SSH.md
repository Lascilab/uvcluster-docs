# Conexiones
La forma mas común de acceder al cluster es hacerla utilizando un cliente de SSH. Puedes elegir entre una plentora dependiendo del
sistema operativo en el que te encuentres o la afinidad con el programa elegido. 

> Recuerda que para acceder necesitas tener tanto el nombre de usuario como la contraseña de tu cuenta.

## Clientes SSH
El acceso al cluster se realiza utilizando un programa de ssh llamado cliente a través del puerto 22.

Windows | Linux
------------ | -------------
Putty | Línea de comandos*
Reminna | Reminna

## Conexión por consola
Si estas usando Linux es probable que ya cuentes con el cliente de SSH, de no ser así, puedes descargarlo ejecutando el comando `sudo apt-get install openssh-client` o bien descargando el paquete apropiado para tu distribución. Luego de tenerlo, abre una terminal y ejecuta el comando

```
ssh <usuario>@<dirección_cluster>
```

## Conexión usando Putty
Si estas usando Windows (XP, Vista, 7, 8 o 10), puedes usar Putty, un cliente de SSH fácil de configurar y de usar. Descargalo desde [esta](https://the.earth.li/~sgtatham/putty/latest/x86/putty.exe) página. No hace falta instalarlo porque se trata de un programa portable, asi que haz doble click sobre su ícono y aparecerá esta ventana

![Image of Yaktocat](https://developers.openshift.com/images/overview-ssh-putty-configure-3.png)

En el campo `Hostname o ip` ingresa la IP del cluster, selecciona el botón `open` luego se abrirá una consola en la que podras colocar tu nombre de usuario y la contraseña asignada.

## Conexión usando Remmina
Tanto para Windows como para Linux puedes usar Remmina, un cliente de SSH, SCP y SFTP. 

Para mas información visita la siguiente [página](http://www.remmina.org/wp/)
