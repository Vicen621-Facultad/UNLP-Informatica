---
isSystem: true
negativos: Si puede
rango: $[-(2^{n-1})...+(2^{n-1}-1)]$
abreviatura: Ex2
---
# Exceso

Rango: $[-(2^{n-1})...+(2^{n-1}-1)]$
Los negativos empiezan con 0
Los positivos empiezan con 1

El exceso es una constante que tiene el valor del bit mas significativo. Es decir 
$$E=2^{n-1}$$

---

## Como representar en este sistema:

### Binario a Decimal

1. Se interpreta el numero en [Binario Sin Signo](Binario%20Sin%20Signo.md)
2. Se le resta el Exceso

%%TODO: Pasar a formato multiline de MathJax%%

Ejemplo:
0100<sub>2 Ex2</sub> = -4<sub>10</sub>

0100<sub>2</sub> = 4<sub>10 BSS</sub>
             = $4-8$ -> Exceso
             = -4

### Decimal a Binario

1. Se le suma el exceso
2. El resultado se representa en [Binario Sin Signo](Binario%20Sin%20Signo.md)

Ejemplo:
-7<sub>10</sub> = 0001<sub>2 Ex2</sub>

-7<sub>10</sub> ->  $-7+8$ -> Exceso
			= 1<sub>10</sub> = 0001<sub>2 BSS</sub>