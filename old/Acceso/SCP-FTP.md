#Envio de archivos
A parte de interactuar con el sistema, es probable que quieras enviar o traer de vuelta archivos. Para tal fin presentamos cuatro opciones SCP, SFTP, RSync y BBCP. Puedes complementar esta información con los tutoriales disponibles en internet o bien en las páginas oficiales de cada programa.

## SCP
Es un medio de transferencia segura de archivos usando el protocolo de [SSH](SSH.md)

### Clientes SCP
Windows | Linux | Mac |
------------ | ------------- | -----------|
WinSCP | Línea de comandos* | [CyberDuck](https://cyberduck.io/) |
Reminna | Reminna | .. |

### Conexión usando la línea de comandos
Al haber instalado el cliente de SSH para Linux, es probable que se haya instalado ademas el cliente para SCP. Este ofrece, entre varias opciones, dos operaciones que nos servirán para nuestro propósito, una es el envió de archivos y la otra poder recibirlos.

Para recibirlos, abre una terminal y completas los campos del siguiente comando (si quieres traer una carpeta, agrega la opción `R`)

```
scp <R> <usuario>@<dirección_cluster>:/direccion/de/la/carpeta/o/archivo/remoto /direccion/de/la/carpeta/local
```

Para enviar, abre una terminal y completa los campos
```
scp <R> /direccion/de/la/carpeta/local <usuario>@<dirección_cluster>:/direccion/de/la/carpeta/o/archivo/remoto 
```

### Conexión usando Remmina
Al igual que para SSH, tambien puedes usar el programa Remmina. Para mas información visitar la siguiente [página](http://www.remmina.org/wp/)

## SFTP

Windows | Linux
------------ | -------------
Fillezilla | Fillezila
... | línea de comandos

## RSync sobre SSH
Rsync es un programa muy útil que puede sincronizar todo un árbol de directorios, enviando únicamente los cambios que se han realizado. Para mas información `man rsync`.

Para sincronizar el directorio actual de tu pc con el del cluster:
```
rsync --rsh=ssh --archive --stats --progress localdir/ \
        <usuario>@<dirección_cluster>:/direccion/de/la/carpeta/remota
http://www.tchpc.tcd.ie/node/432

## BBCP
Tambien se puede usar para transferir grandes volumenes de datos sin encriptar
https://github.com/eeertekin/bbcp
```
