#!/bin/bash
g++ -std=c++11 -o main luhntest.cpp
condor_submit luhntest.submit 
