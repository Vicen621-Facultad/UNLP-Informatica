# Representar e interpretar entre los diferentes sistemas

## Tabla de equivalencias

|     Decimal     |     Binario      |  Hexadecimal   |
|:---------------:|:----------------:|:--------------:|
| 0<sub>10</sub>  | 0000<sub>2</sub> | 0<sub>16</sub> |
| 1<sub>10</sub>  | 0001<sub>2</sub> | 1<sub>16</sub> |
| 2<sub>10</sub>  | 0010<sub>2</sub> | 2<sub>16</sub> |
| 3<sub>10</sub>  | 0011<sub>2</sub> | 3<sub>16</sub> |
| 4<sub>10</sub>  | 0100<sub>2</sub> | 4<sub>16</sub> |
| 5<sub>10</sub>  | 0101<sub>2</sub> | 5<sub>16</sub> |
| 6<sub>10</sub>  | 0110<sub>2</sub> | 6<sub>16</sub> |
| 7<sub>10</sub>  | 0111<sub>2</sub> | 7<sub>16</sub> |
| 8<sub>10</sub>  | 1000<sub>2</sub> | 8<sub>16</sub> |
| 9<sub>10</sub>  | 1001<sub>2</sub> | 9<sub>16</sub> |
| 10<sub>10</sub> | 1010<sub>2</sub> | A<sub>16</sub> |
| 11<sub>10</sub> | 1011<sub>2</sub> | B<sub>16</sub> |
| 12<sub>10</sub> | 1100<sub>2</sub> | C<sub>16</sub> |
| 13<sub>10</sub> | 1101<sub>2</sub> | D<sub>16</sub> |
| 14<sub>10</sub> | 1110<sub>2</sub> | E<sub>16</sub> |
| 15<sub>10</sub> | 1111<sub>2</sub> | F<sub>16</sub> |

---

## Binario a Decimal

En este caso hay que usar el Teorema fundamental de la numeración $$N=\sum_{i=-d}^nX_i*B^i$$
Por ejemplo: $10100101_2=1*2^7+0*2^6+1*2^5+0*2^4+0*2^3+1*2^2+0*2^1+1*2^0=165_{10}$
$1011.011_2=1*2^3+0*2^2+1*2^1+1*2^0+0*2^{-1}+1*2^{-2}+1*2^{-3}=11.375_{10}$

## Hexadecimal a Decimal

En este caso hay que usar el Teorema fundamental de la numeración $$N=\sum_{i=-d}^nX_i*B^i$$
Por ejemplo: $9F7_{16}=9*16^2+15*16^1+7*16^0=2551_{10}$
$10.2_{16}=1*16^1+0*16^0+2*16^{-1}=16.125_{10}$

## Decimal a Binario

Para pasar un numero de decimal a binario la parte entera y la decimal se pasan de maneras diferentes

### Parte Entera

Hay 2 maneras de pasar la parte entera

#### Dividiendo

En esta manera lo que tenés que hacer es dividir la parte entera entre 2 hasta que el cociente sea 0 y se escriben los restos de atrás para adelante.

Ejemplo:
![Ejemplo de Decimal a Binario](_assets/DecimalToBinaryEx.png)

#### Restando potencias de 2

Esta forma es mas simple, tenés que restarle la potencia de 2 mas alta posible, el bit que de esa potencia va a ser 1.

Ejemplo:
319<sub>10</sub> = 256-

## Binario a Hexadecimal

En este caso hay que usar la tabla de Binario Codificado Hexadecimal que es la siguiente:

Lo que hay que hacer es dividir el numero en binario en bloques de 4 dígitos, empezando de derecha a izquierda, si el ultimo bloque tiene menos de 4 dígitos se le suman 0 adelante. Una vez tenés todos los bloques, lo buscas en la tabla y le pones el simbolo correspondiente.

Ejemplo: 10100101<sub>2</sub> = A5<sub>16</sub>

