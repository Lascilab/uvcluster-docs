#Envio de archivos
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam velit turpis, finibus sit amet imperdiet ut, venenatis a diam. Aliquam erat volutpat. Sed mi nulla, cursus eget consectetur pulvinar, lacinia eu nunc. Vestibulum auctor magna vitae odio eleifend, vitae accumsan dui sodales. Ut iaculis arcu at nunc rutrum faucibus. Nunc in dui venenatis, lobortis ex nec, congue ipsum. Vestibulum pulvinar ultricies purus vel consectetur. Praesent leo enim, dapibus quis pellentesque quis, sodales nec quam. Curabitur luctus nulla ex, sed sollicitudin odio ullamcorper sed. Mauris molestie tincidunt lacinia. Praesent eu semper ligula. Duis nec sollicitudin turpis. In porta vitae ipsum vitae feugiat. Aliquam aliquet ultricies turpis. Morbi luctus neque ac mauris ultrices cursus. Mauris dignissim ipsum ac pharetra lobortis.

## SCP
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam velit turpis, finibus sit amet imperdiet ut, venenatis a diam. Aliquam erat volutpat. Sed mi nulla, cursus eget consectetur pulvinar, lacinia eu nunc. Vestibulum auctor magna vitae odio eleifend, vitae accumsan dui sodales. Ut iaculis arcu at nunc rutrum faucibus. Nunc in dui venenatis, lobortis ex nec, congue ipsum.

### Clientes SCP
Windows | Linux
------------ | -------------
WinSCP | Línea de comandos*
Reminna | Reminna

### Conexión usando la línea de comandos

Para traer
```
scp <R> <usuario>@<dirección_cluster>:/direccion/de/la/carpeta/o/archivo/remoto /direccion/de/la/carpeta/local
```

Para enviar
```
scp <R> /direccion/de/la/carpeta/local <usuario>@<dirección_cluster>:/direccion/de/la/carpeta/o/archivo/remoto 
```

### Conexión usando Remmina
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam velit turpis, finibus sit amet imperdiet ut, venenatis a diam. Aliquam erat volutpat. Sed mi nulla, cursus eget consectetur pulvinar, lacinia eu nunc. Vestibulum auctor magna vitae odio eleifend, vitae accumsan dui sodales. Ut iaculis arcu at nunc rutrum faucibus. Nunc in dui venenatis, lobortis ex nec, congue ipsum. Vestibulum pulvinar ultricies purus vel consectetur. Praesent leo enim, dapibus quis pellentesque quis, sodales nec quam. Curabitur luctus nulla ex, sed sollicitudin odio ullamcorper sed. Mauris molestie tincidunt lacinia. Praesent eu semper ligula. Duis nec sollicitudin turpis. In porta vitae ipsum vitae feugiat. Aliquam aliquet ultricies turpis. Morbi luctus neque ac mauris ultrices cursus. Mauris dignissim ipsum ac pharetra lobortis.

Para mas información visitar la siguiente [página](http://www.remmina.org/wp/)

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
        
## BBCP
Tambien se puede usar para transferir grandes volumenes de datos sin encriptar
https://github.com/eeertekin/bbcp
```
