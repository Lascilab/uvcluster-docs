Scaling = 5
TotalCols = LCM[7/4, 2]*Jobs*Scaling
TotalRows = Ceiling[(TotalCols - 1)*4/7]
maxIterations = 120;

MandelbrotPixel =
  Compile[{{ColNum, _Integer}, {RowNum, _Integer}},
   Module[{x = 0., y = 0., xtemp, iterations = 0},
    While[x^2 + y^2 <= 4 && iterations < maxIterations,
     xtemp = x*x - y*y + (ColNum - 1)*3.5/TotalCols - 2.5;
     y = 2*x*y + (RowNum - 1)*2/TotalRows - 1;
     x = xtemp;
     iterations = iterations + 1;];
    iterations], CompilationTarget -> "C"];

MandelbrotData =
 Table[MandelbrotPixel[i, j], {j, 1,
   TotalRows}, {i, (PID - 1)*TotalCols/Jobs + 1, (TotalCols/Jobs)*
    PID}];

Export[StringJoin[
  "mandelbrot." <>IntegerString[PID, 10, IntegerLength[Jobs]]<> ".csv"], MandelbrotData, "CSV"]
