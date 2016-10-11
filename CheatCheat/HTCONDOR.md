#HTCondor

Mostramos una lista de los comandos mas útiles para usar HTCondor

## Consultar los recursos del cluster
`condor_status`

## Consultar la cola
 - `condor_q`
 - `condor_q -l (job #)`
 - `condor_q -format '\n%s' condor_var`
 
## Enviar un Job a la cola
`condor_submit`

## Eliminar un Job de la cola
`condor_rm`

## Consultar el historial de jobs
`condor_history`

## ¿Esta condor ejecutandose?
`ps aux l grep condor_{master,schedd,collector,negotiator}`

## Usando un alias

En el ~/.bashrc

```bash
alias cst=condor_status
alias cq=condor_q
alias cs=condor_submit
alias ch=condor_history
```
# Recursos
[Lista oficial de comandos](http://research.cs.wisc.edu/htcondor/manual/v8.5/11_Command_Reference.html)
[Lista del CERN](https://twiki.cern.ch/twiki/bin/view/CMSPublic/CompOpsGlideinWMSCondorCommands)
[Lista de comandos iac.es](http://vivaldi.ll.iac.es/sieinvens/siepedia/pmwiki.php?n=HOWTOs.CondorUsefulCommands)
