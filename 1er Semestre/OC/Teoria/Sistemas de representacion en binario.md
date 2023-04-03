# Sistemas de representacion en binario
Los sistemas de represetacion se usan para representar numeros en el sistema binario. 

## Propiedades

Todos los sistemas de representacion tienen las siguientes propiedades:

### Rango

El rango de un sistema es la diferencia entre el menor numero que se puede representar y el mayor numero. Es decir, la cantidad de numeros que podes representar en el sistema.

Por ejemplo, en un sistema decimal donde hay un numero entero y 2 numeros decimales el rango seria el siguiente: 0,00 - 9,99 (1000)

La formula para calcular el rango es: B<sup>n</sup>

### Resolución

La resolucion de un sistema es la diferencia entre dos numeros consecutivos. Los "saltos" que da entre numeros.

Siguiendo con el ejmplo de arriba, la resolucion seria 0,01.

La formula para caluclar la resolucion es: B<sup>d</sup>. Siendo `d` la posicion del bit menos significativo

### Error

El error es la diferencia en valor absoluto entre el numero que quiero representar y el que puedo representar en el sistema que se esta usando.

Por ejemplo: si quiero representar el 1,2<sub>10</sub> en un sistema con 1 bit entero y 4 bits decimales quedaria: 1,0011<sub>2</sub> con un error del 0,0125<sub>10</sub> o, un error del 1,25%

La formula para calcular el error es: | x - x' |

---

## Sistemas

La siguiente tabla muestra los distintos sistemas
```dataview
table abreviatura as "Abreviatura", negativos as "Puede representar negativos", rango as "Formula del Rango", formula as "Formula de traspaso"
from "1er Semestre/OC/Teoria" 
where isSystem = true
```
