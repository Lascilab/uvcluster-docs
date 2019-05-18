# Mathematica

> Tomado de https://confluence.grid.iu.edu/display/CON/Application+Example+-+Mathematica

... El resultado es un mandelbrot.csv. Y ya que no se pueden ejecutar gráficos en 
el cluster entonces es necesario que el paso adicional lo hagas en tu pc:

```
Mandelbrot = Import["mandelbrot.csv"]
ArrayPlot[Transpose[Mandelbrot], ColorFunction -> "Rainbow"]
```
