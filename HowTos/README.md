# How To

## ¿Cómo creo una imagen de docker? Dockerfile (R por paquetes, Matlab)
..
## ¿Cómo creo una imagen de docker? Docker commit (R por paquetes)
..
## ¿Cómo envío mi imagen al repositorio del cluster? (Vista)
..
## ¿Cómo publico una imagen de docker? dockerhub git
..
## ¿Cómo publico una imagen de docker? dockerhub, docker push
..
## ¿Cómo hago una replica del cluster en mi computador?

Necesita instalar:

- HTCondor
- Docker

### Centos 7
> Para Centos 6 cambie la url https://research.cs.wisc.edu/htcondor/yum/repo.d/htcondor-stable-rhel6.repo

```
#!/bin/bash
$ cd /etc/yum.repos.d/
$ sudo wget https://research.cs.wisc.edu/htcondor/yum/repo.d/htcondor-stable-rhel7.repo
$ sudo yum install -y epel-release
$ sudo yum install -y condor condor-python nano
$ curl -fsSL https://get.docker.com/ | sudo sh
$ sudo gpasswd -a ${USER} docker
$ sudo gpasswd -a condor docker
$ newgrp docker
$ sudo service docker restart
$ sudo service condor restart

ps -ef | grep condor
condor_reconfig
condor_status -const HasDocker
``

### Ubuntu 14.04
> Para Ubuntu 12.04 cambie la palabra trusty por ...

```
$ echo "deb [arch=amd64] http://research.cs.wisc.edu/htcondor/ubuntu/stable/ trusty contrib" | sudo tee -a /etc/apt/sources.list
$ echo "deb [arch=amd64] http://research.cs.wisc.edu/htcondor/ubuntu/development/ trusty contrib" | sudo tee -a /etc/apt/sources.list
$ wget -qO - http://research.cs.wisc.edu/htcondor/ubuntu/HTCondor-Release.gpg.key | sudo apt-key add -
$ sudo apt-get update
$ sudo apt-get install -y condor
$ curl -fsSL https://get.docker.com/ | sudo sh
$ sudo gpasswd -a ${USER} docker
$ sudo gpasswd -a condor docker
$ newgrp docker
$ sudo service docker restart
$ sudo service condor restart
```

### Windows

> Si se encuentra en Windows, le sugerimos crear una máquina virtual de Ubuntu o Centos

## ¿Cómo puedo instalar un software en particular en el cluster?
## Mis trabajos dependen entre sí, ¿cómo puedo organizarlos? Dagman, Swift, Pegasus

