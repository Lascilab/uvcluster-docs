(* ::Package:: *)

(* ::Input:: *)
eqn=D[z[t,s],t,t]==-(z[t,s]/(z[t,s]^2+(1/2 (1+0.1 Sin[2 Pi t]))^2)^(3/2));
sols=ParallelTable[localsol=NDSolve[{eqn,z[0,s]==param s,Derivative[1,0][z][0,s]==param},z,{t,0,10}, {s,1,2}]; 
Plot3D[Evaluate[z[tp, z0]/.localsol],{tp,0,10},{z0,1,2},PlotRange->{-5,5},PlotLabel->param,ColorFunction->"TemperatureMap"],
{param, -1,1,0.01},Method->"FinestGrained"];
Export["FiniteElement.gif",sols];
