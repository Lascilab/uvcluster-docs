> Tomado de [Rosseta code](http://rosettacode.org/wiki/Luhn_test_of_credit_card_numbers#C.2B.2B)
El test de Luhn es usado por algunas empresas para determinar si los números de una tarjeta de crédito son válidos, realizando el siguiente procedimiento 
o algoritmo:

1. Cambiamos el orden de los dígitos del número: ahora el primero será el último y viceversa.
2. Tomamos los números de posiciones impares en la cadena que esta al revés y sumamos guardo el resultado en una suma parcial `s1`
3. Tomamos los números de posiciones pares en la cadena que esta al revés:
  Multiplicamos cada dígito por dos (si este resultado resulta en dos cifras, entonces se suman estos dos dígitos, ver ejemplo)
4. Sumamos los números pares guardando el resultado en una suma parcial `s2`
5. Si `s1+s2` termina en `0` entonces el número original forma una tarjeta de crédito válida.

Por ejemplo, si el número de la tarjeta de crédito es 49927398716, entonces: 

```
Ponemos al revés los números:
  61789372994
Sumamos los dígitos con posiciones impares:
  6 + 7 + 9 + 7 + 9 + 4 = 42 = s1
Selecionamos los dígitos con posiciones pares:
    1,  8,  3,  2,  9
  Multiplicamos cada dígito por 2:
    2, 16,  6,  4, 18
  Sumamos las cifras de cada dígito (ej: `16=1+6=7`):
    2,  7,  6,  4,  9
  Sumamos esto último:
    2 + 7 + 6 + 4 + 9 = 28 = s2
```

Así que `s1 + s2 = 70` Lo cual significa que el número `49927398716` aprueba el test.

Podemos automatizar el procedimiento usando C++ para validar los siguientes números:

| Posible t.de.créd |
|-------------------|
| 49927398716       |
| 49927398717       |
| 1234567812345678  |
| 1234567812345670  |

Usando ademas HTCondor.
```
$ ./ejecutar.sh
```
