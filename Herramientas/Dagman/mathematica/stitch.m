Export["mandelbrot.csv",
 Flatten[Table[
   Transpose[Import[FileNames["*.csv"][[i]]]], {i, 1,
    Length[FileNames["*.csv"]]}], 1]];
