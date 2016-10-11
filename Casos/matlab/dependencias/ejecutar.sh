#!/bin/bash
mcc -m -R -singleCompThread -R -nodisplay -R -nojvm -nocache mymain.m
condor_submit mymain.submit
