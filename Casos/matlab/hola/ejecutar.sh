#!/bin/bash
mcc -m -R -singleCompThread -R -nodisplay -R -nojvm -nocache hola.m
condor_submit hola.submit
