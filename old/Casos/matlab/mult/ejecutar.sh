#!/bin/bash
mcc -m -R -singleCompThread -R -nodisplay -R -nojvm -nocache mult.m
condor_submit mult.submit
