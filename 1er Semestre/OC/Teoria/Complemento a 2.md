---
isSystem: true
negativos: Si puede
rango: $[-(2^{n-1})...+(2^{n-1}-1)]$
formula: $Ca2 = 2^n-N$
abreviatura: Ca2
---

# Complemento a 2

Rango: $[-(2^{n-1})...+(2^{n-1}-1)]$
Formula para pasar los numero: $Ca2 = 2^n-N$
Los negativos empiezan con 1
Los positivos empiezan con 0

---

## Como representar en este sistema:

Los positivos se representan igual que en el sistema de [Binario Sin Signo](Binario%20Sin%20Signo.md), por otro lado los negativos se representan pasandolo al sistema [Complemento a 1](Complemento%20a%201.md) y sumandole 1<sub>10</sub> (0001<sub>2</sub>)

Ejemplo con un sistema de 4 bits:

$4_{10}=0100_{2\ Ca2}$
$-4_{10}=1100_{2\ Ca2}$

Siguiendo esta formula tambien podemos pasar los numeros: $$Ca2=2^n-N$$
$Ca1 = 2^4-(-4) = 8+4$
$1000_2 + 0100_2 = 1100_2$ 

### Pasos para representar negativos en este sistema

1. Pasas el decimal a [Binario Sin Signo](Binario%20Sin%20Signo.md)
2. Das vuelta todos los bits del numero
3. Le sumas 1<sub>10</sub> (0001<sub>2</sub>) al numero

Ejemplo:
$$\begin{eqnarray}

\end{eqnarray}$$
$-7_{10}=0111_{2\ BSS}$
         $= 1000_{2\ Ca1}$
         $= 1001_{2\ Ca2}$

#### Otra manera de representar mas facil

1. Pasas el decimal a [Binario Sin Signo](Binario%20Sin%20Signo.md)
2. Escribís los dígitos de derecha a izquierda hasta escribir el primer 1 que aparezca
3. Das vuelta los dígitos restantes

$-7_{10}=0111_{2\ BSS}$
         $= \color{aquamarine}---\color{lightgreen}1$ (Escribís hasta el primer 1)
         $= \color{aquamarine}100\color{lightgreen}1\color{gray}_{2\ Ca2}$ (Das vuelta los demás bits)
 