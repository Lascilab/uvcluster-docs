# Development Guide

Gitbook support Markdown to generate the documentation. This documentation can be genetared with the 
gitbook CLI of Node JS library. You can code the documetation un pure markdown and user the gitbook cli
to render the documentation in HTML.

Creae a development directory.

```sh
mkdir lascilab && cd lascilab
```

Download Node Image.

```sh
docker pull node
```

Create the Node development environment.

```sh
docker run -it --name lascilab -p 4000:4000 -v $PWD:/lascilab node bash
```

Within the container, enter to the shared dierctory.

```sh
cd /lascilab
```

Install the gitbook cli.

```sh
npm install -g gitbook-cli --save-dev
```

Clone the user documentation repository in the development branch.

```sh
git clone https://github.com/Lascilab/Uvcluster.git -b develop
```

Entry into the local repository.

```sh
cd Uvcluster
```

Serve the docuementation in development.

```sh
gitbook serve
```

Look for the rendered docuemnation at http://localhost:4000/

## Documentation State 

## Introduction (Aurelio)
 - [x] Cluster + Cluster Univalle

## QuickStart - HTCondor (John, Aurelio)
- [ ] Connect to the cluster on Windows
- [ ] Connect to the cluster on Linux
- [ ] Launch your first job (send data, launch job)
- [ ] Monitoring and collecting job’s results

## QuickStart - Docker (Jhon Fredy, Carlos Arango)
- [ ] ¿What is Docker? ¿Why we use Docker?
- [ ] Docker Hub
- [ ] Containerized apps (Docker Images, Dockerfiles)
- [ ] Execute Docker containers

## QuickStart - HTCondor + Docker (Edier, Everyone)
- [ ] ¿Why we mix them?
- [ ] Launch Docker containers as Condor tasks


## References

* [Getting Started Gitbook Documentation using Markdown](https://www.netlify.com/blog/2015/12/08/a-step-by-step-guide-gitbook-on-netlify/)
* [GitBook Cli and GitBook Web](https://docs.gitbook.com/v2-changes/important-differences)
