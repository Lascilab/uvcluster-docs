#!/bin/bash
mcc -m -R -singleCompThread -R -nodisplay -R -nojvm -nocache bublP.m
condor_submit bublP.submit
