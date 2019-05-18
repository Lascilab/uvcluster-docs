#!/bin/bash
mcc -m -R -singleCompThread -R -nodisplay -R -nojvm -nocache colorABN.m
condor_submit colorABN.submit
