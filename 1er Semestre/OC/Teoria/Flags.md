
# Flags

Las ecuaciones en binario tienen flags que te indican el estado del resultado. Las flags son las siguientes:

* Z (Cero): Vale 1 si y solo si el resultado es 0.

* C (Carry): En una suma vale 1 si me falta un bit para representar el resultado. Carry al bit mas significativo.
  En la resta vale 1 si hay "Borrow" hacia el bit mas significativo. Si le pedis prestado a un bit que no existe.
  
  * N (Negativo): Vale lo mismo que el bit mas significativo
  
  * V (Overflow): Vale 1 solo si: una suma de positivos da negativo, una suma de negativos da positivo, un negativo menos un positivo da positivo o si un positivo menos un negativo da negativo $$+_1++_2=-||-_1+-_2=+||-_1-+_1=+||+_1--_1=-$$
Ejemplo de ecuaciones con sus respectivas flags:

  1001 |       9          C = 1, Z = 0, N = 0, V = 1
\+ 1100 | + 12
= 0101 | = 5


  0101  |    5         C = 0, Z = 0, N = 0, V = 0
\- 0100 | - 4
\= 0001 | = 1 