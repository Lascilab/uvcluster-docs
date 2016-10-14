# Un pequeño lenguaje de programación

> Gramatica de Happy tomada del [manual](https://www.haskell.org/happy/doc/html/sec-using.html)
> Lex de Alex tomado del [manual](https://www.haskell.org/alex/doc/html/introduction.html)

Queremos hacer un interprete para una calculador por eso planteamos un par de ejemplos
en los que deberia funcionar

> 2+2
> 4

O uno mas complejo

> let n = (2+2)/(2-22) in n + 44
> 43

## Workflow
 - Describimos un analizador lexico que reconoce tokens en forma de expresiones regulares en un programa de Alex
 - Definimos la gramática que queremos parsear a partir de los tokens en un programa de Happy.
 - Generamos el analizador lexico usando alex
 - Generamos la gramática usando Happy.
 - Usamos ambos modulos como parte de un programa de haskell
 - Compilamos tal programa
 - Ejecutamos una prueba

```
carlos@carlos-desktop:~/Dagman/haskell$ ./ejecutar.sh
```

.............

```
carlos@carlos-desktop:~/Dagman/haskell$ condor_q
-- Schedd: carlos-desktop : <192.168.1.10:63014?...
 ID      OWNER            SUBMITTED     RUN_TIME ST PRI SIZE CMD               
  25.0   carlos         10/14 10:33   0+00:00:06 R  0   0.3  condor_dagman -p 0
  26.0   carlos         10/14 10:33   0+00:00:00 I  0   0.0  alex Tokens.x
  27.0   carlos         10/14 10:33   0+00:00:00 I  0   0.0  happy Grammar.y

3 jobs; 0 completed, 0 removed, 2 idle, 1 running, 0 held, 0 suspended
```
......

```
carlos@carlos-desktop:~/Dagman/haskell$ ./Main < prueba1.in
Plus (Int 2) (Int 2)
4
```

