---
isSystem: true
negativos: Si puede
abreviatura: BCD
---
# Binario Codificado Decimal

Se usa para comunicaciones entre perfericos

## Desempaquetado

Cada digito ocupa un byte, se escribe `1111` adelante de cada digito

### Sin Signo

834<sub>10</sub> = 11111000 11110011 11110100<sub>2</sub>
			=       F8              F3              F4<sub>16</sub>

75<sub>10</sub> = 11110111 11110101<sub>2</sub>
	     =       F7             F5<sub>16</sub>

### Con Signo

Al ultimo digito se le agrega el simbolo ad

## Empaquetado