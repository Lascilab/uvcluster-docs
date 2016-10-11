function product(n)
  i = str2num(n);
  filenameI = strcat( 'input', int2str( i ) );
  load( filenameI );
  S = A * B
  filenameO = strcat( 'output', int2str( i ) );
  save( filenameO, 'S' );
