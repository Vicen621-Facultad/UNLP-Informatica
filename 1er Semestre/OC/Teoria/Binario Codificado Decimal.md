---
isSystem: true
negativos: Si puede
abreviatura: BCD
---
# Binario Codificado Decimal

## Desempaquetado

Se usa para comunicaciones entre perfericos
Cada digito ocupa un byte, se escribe `1111` adelante de cada digito

### Sin Signo

834<sub>10</sub> = 11111000 11110011 11110100<sub>2</sub>
			=       F8              F3              F4<sub>16</sub>

75<sub>10</sub> = 11110111 11110101<sub>2</sub>
	     =       F7             F5<sub>16</sub>

### Con Signo

Al ultimo digito se le agrega el simbolo adelante.
\+ -> C = 1100
\- -> D = 1101

-834<sub>10</sub> = 11111000 11110011 11000100<sub>2</sub>
			   =       F8              F3              D4<sub>16</sub>

+69<sub>10</sub> = 11110110 11001001<sub>2</sub>
			=      F6               C9<sub>16</sub>


## Empaquetado

Se utiliza para hacer calculos
Cada digito ocupa solo 4 bits, se escribe sin el relleno

El signo se agrega despues del ultimo numero, no pueden quedar bytes incompletos

+834<sub>10</sub> = 1000 0011 0100 1100<sub>2</sub>
			=       8         3        4         C<sub>16</sub>

+75<sub>10</sub> = 0000 0111 0101 1100<sub>2</sub>
	     =     0         7       5         C<sub>16</sub>

-834<sub>10</sub> = 11111000 11110011 11000100<sub>2</sub>
			   =       F8              F3              D4<sub>16</sub>

+69<sub>10</sub> = 11110110 11001001<sub>2</sub>
			=      F6               C9<sub>16</sub>