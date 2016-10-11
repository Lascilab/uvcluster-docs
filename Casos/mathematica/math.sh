#!/bin/bash
# This script assumes that 1 argument has no additional arguments
# and that 3 arguments follows the form PID and Jobs

export PATH=/usr/local/bin:/usr/bin:/cvmfs/uc3.uchicago.edu/Wolfram/Mathematica/8.0/Executables

math -script $1
