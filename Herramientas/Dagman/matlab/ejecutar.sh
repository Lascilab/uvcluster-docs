#!/bin/bash
mcc -m -R -singleCompThread -R -nodisplay -R -nojvm -nocache collect.m
mcc -m -R -singleCompThread -R -nodisplay -R -nojvm -nocache initialize.m
mcc -m -R -singleCompThread -R -nodisplay -R -nojvm -nocache product.m
condor_submit_dag dagman.dag
