#!/bin/bash
# g++ -o main MC_RTE.cpp

m=320

l=$(($1%$m +380))
d=$(((($1 -$l) / $m)+1))
echo $l--$d
./main $l $d

#for (( d=0; d<=23; d++ ))
#do
#   for (( l=380; l<=700; l++ ))
#   do
#       condor_submit lambda=$l hora=$d mc_rte.submit 
#   done
#done
