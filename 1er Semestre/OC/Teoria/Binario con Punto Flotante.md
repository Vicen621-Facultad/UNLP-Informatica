---
isSystem: true
---

# Binario con punto flotante

El sistema de binario con punto flotante se usa para representar números muy grandes. Se usa la siguiente ecuación: $$\color{lightgreen}M\color{lightgray}*B\color{red}^E$$
Siendo la Mantisa (M), el Exponente (E) y la Base del sistema (B), en nuestro caso B es 2 ya que estamos usando sistema binario.

A la hora de interpretar binarios escritos en este sistema siempre tenemos que saber cuantos bits hay en la Mantisa, cuantos en el Exponente y en que sistema estan representados cada uno.

Ejemplo:
1101001 4 Bits de Mantisa representado en BSS y 3 bits de Exponente representado en BSS.
$$\begin{eqnarray}
\color{lightgreen}1101\color{lightgray}*2\color{red}^{001} &=& \\
\color{lightgreen}13\color{lightgray}*2\color{red}^1 &=& \\\color{lightgreen}13\color{lightgray}*2
&=& 26
\end{eqnarray}$$

## Mantisa fraccionaria

Cuando la mantisa es fraccionaria se le agrega un $0,$ adelante de la mantisa, quedando la ecuación final de esta manera: 
$$\color{cyan}0,\color{lightgreen}M\color{lightgray}*B\color{red}^E$$

Ejemplo: 
Sistema 5 bits de mantisa fraccionaria y 3 bits de exponente, ambos en BSS: 01010011
$$\begin{eqnarray}
\color{cyan}0,\color{lightgreen}01010\color{lightgray}*2\color{red}^{011} &=& \\
\color{cyan}0,\color{lightgreen}3125\color{lightgray}*2\color{red}^3 &=& \\
\color{cyan}0,\color{lightgreen}3125\color{lightgray}*8 
&=& 2,5
\end{eqnarray}$$

Cuando el sistema tiene signo el bit del signo se saca de la mantisa y te quedas con los bits restantes.

Ejemplos:
1. 1001101\. 4 Bits Mantisa fraccionaria BCS, 3 exponente BCS $$\begin{eqnarray}
-\color{cyan}0,\color{lightgreen}001\color{lightgray}*2\color{red}^{101} &=& \\
-\color{cyan}0,\color{lightgreen}125\color{lightgray}*2\color{red}^{-1} &=& \\
-\color{cyan}0,\color{lightgreen}125\color{lightgray}*0,5
&=& -0,0625
\end{eqnarray}$$

2. 01011010\. 4 Bits Mantisa Fraccionaria BCS, 4 exponente BSS $$\begin{eqnarray}
+\color{cyan}0,\color{lightgreen}101\color{lightgray}*2\color{red}^{1010} &=& \\
\color{cyan}0,\color{lightgreen}625\color{lightgray}*2\color{red}^{10} &=& \\
\color{cyan}0,\color{lightgreen}625\color{lightgray}*1024
&=& 640
\end{eqnarray}$$

## Mantisa fraccionaria normalizada

Ya que hay muchas maneras de poder representar un mismo numero con el sistema de Punto flotante se creo la Mantisa Fraccionaria normalizada, con esta representacion la mantisa siempre debe comenzar con $0,1$, de no ser asi no se puede representar el nu