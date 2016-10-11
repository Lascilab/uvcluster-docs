function initialize(n)
  n = str2num(n);
  for i = 1:n
    index = i;
    A=rand(2,2)
    B=rand(2,2)
    filename=strcat('input',int2str(i));
    save( filename, 'A', 'B', 'index');
end
