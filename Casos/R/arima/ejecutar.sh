#!/bin/bash
cp arima_example.R run_1/
cp arima_example.R run_2/
cp arima_example.R run_3/

condor_submit arima_example.sub
