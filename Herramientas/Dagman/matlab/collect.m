function collect(n)
  n = str2num(n);
  C = zeros(2);
  for i = 1:n
    filename = strcat( 'output', int2str( i ) );
    load( filename );
    C = C + S
  end
