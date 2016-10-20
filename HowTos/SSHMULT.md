# Usando multiples veces la conexión de SSH
Para hacerlo conveniente, un usuario que utilice varias terminales simultaneamente, 
puede reutilizar una conexión para varias. Despues de loguearse, las terminales 
subsecuentes pueden usar la primera conexión sin necesidad de especificar el login o el password.
Para habilitar esta caracteristica basta con editar la configuración en ` ~/.ssh/config`

```
lascilab@lascilab-pc:~/.ssh/ $ nano ~/.ssh/config

Host *
ControlMaster auto
ControlPath /tmp/%r@%h:%p
ControlPersist 2h
```

Si dicho archivo no existe, puede crearlo y ejecutando `touch ~/.ssh/config && chmod 600 ~/.ssh/config`
