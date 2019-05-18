#=
Pkg.add("ClusterManagers") -- ~/.julia-htc
using ClusterManagers
# export HOSTNAME=`hostname`
np = 1
#addprocs_htc(np) # agregar procesos a HTCondor
addprocs(HTCManager(np))

hosts = []
pids = []
for i in workers()
    host, pid = fetch(@spawnat i (gethostname(), getpid()))
    push!(hosts, host)
    push!(pids, pid)
end

for i in workers()
    rmprocs(i)
end



############################################
=#
using ClusterManagers

addprocs_htc(5)
@everywhere using(DataFrames)
@everywhere df = DataFrame(Origin = ["a","b","c","d","a","d"], 
Target = ["j", "f", "g", "h", "i", "j"])
@everywhere function randNdCol(mytable)
    p=randperm(length(mytable[2]))
    mytable[2]=mytable[2][p]
    return mytable
    end

newDf=[]

M = [df for i=1:10]
pmap(randNdCol, M)
rmprocs(workers());
