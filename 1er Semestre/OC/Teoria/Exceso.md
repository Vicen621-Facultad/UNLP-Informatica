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

Ejemplo:
$$\begin{eqnarray}
0100_{2\ Ex2} &=& -4_{10} \\
\\
0100_2 &=& 4_{10\ BSS} \\
&=& 4 - 8 \Rightarrow \text{Exceso} \\
&=& -4
\end{eqnarray}$$

### Decimal a Binario

1. Se le suma el exceso
2. El resultado se representa en [Binario Sin Signo](Binario%20Sin%20Signo.md)

Ejemplo:

$$\begin{eqnarray} 
-7_{10} &=& 0001_{2\ Ex2} \\
\\
-7_{10} &\rightarrow& -7+8 \Rightarrow \text{Exceso} \\
&=& 1_{10} \\
&=& 0001_{2\ BSS}
\end{eqnarray}$$