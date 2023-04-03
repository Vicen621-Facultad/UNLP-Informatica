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

Los positivos se representan igual que en el sistema de [[Binario Sin Signo]], por otro lado los negativos se representan pasandolo al sistema [[Complemento a 1]] y sumandole 1<sub>10</sub> (0001<sub>2</sub>)

Ejemplo con un sistema de 4 bits:

4<sub>10</sub> = 0100<sub>2 Ca2</sub>
-4<sub>10</sub> = 1100<sub>2 Ca2</sub>

Siguiendo esta formula tambien podemos pasar los numeros: $$Ca2=2^n-N$$
$Ca1 = 2^4-(-4) = 8+4$
$1000_2 + 0100_2 = 1100_2$ 

### Pasos para representar negativos en este sistema

1. Pasas el decimal a [[Binario Sin Signo]]
2. Das vuelta todos los bits del numero
3. Le sumas 1<sub>10</sub> (0001<sub>2</sub>) al numero

Ejemplo:
-7<sub>10</sub> = 0111<sub>2 BSS</sub>
        = 1000<sub>2 Ca1</sub>
        = 1001<sub>2 Ca2</sub>

#### Otra manera de representar mas facil

1. Pasas el decimal a [[Binario Sin Signo]]
2. Escribis los digitos de derecha a izquierda hasta escribir el primer 1 que aparezca
3. Das vuelta los digitos restantes

-7<sub>10</sub> = 0111<sub>2 BSS</sub>
        = \_\_\_1<sub>2</sub> (Escribis hasta el primer 1)
        = 1001 <sub>2 Ca2</sub> (Das vuelta los demas bits)
 