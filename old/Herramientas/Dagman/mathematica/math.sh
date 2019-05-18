#!/bin/bash
# This script assumes that 1 argument has no additional arguments
# and that 3 arguments follows the form PID and Jobs

export PATH=/usr/local/bin:/usr/bin:/cvmfs/uc3.uchicago.edu/Wolfram/Mathematica/8.0/Executables

if [ $# -eq 1 ]; then
  math -run < $1
elif [ $# -eq 2 ]; then
  math -run "PID=`expr $2 + 1`" < $1
elif [ $# -eq 3 ]; then
  math -run "PID=`expr $2 + 1`;Jobs=$3" < $1
else
  echo "Wrong number of arguments"
  echo "Usage: math.sh batch.m [PID] [Number of Jobs]"
fi
