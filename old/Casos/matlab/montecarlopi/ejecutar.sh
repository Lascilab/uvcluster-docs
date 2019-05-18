#!/bin/bash
mcc -m -R -singleCompThread -R -nodisplay -R -nojvm -nocache montecarlopi.m
condor_submit montecarlopi.submit
