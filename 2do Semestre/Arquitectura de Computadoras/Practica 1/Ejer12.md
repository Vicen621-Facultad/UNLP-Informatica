# Ejercicio 12

```pascal
     ORG 3000h
MUL: CMP AX, 0
     JZ FIN
     ADD CX, AX
     DEC AX
     CALL MUL
FIN: RET

     ORG 2000h
     MOV CX, 0
     MOV AX, 3
     CALL MUL
     HLT
     END
```

a. La subrutina suma la sucesion de numero de manera tal `n + (n - 1) + (n - 2) + ... + 2 + 1`
b. El valor final de CX en este ejemplo es 6. En forma general el valor de CX es: `AX + (AX - 1) + (AX - 2) + ... + 2 + 1`
c. comeme la poronga
d. La limitacion del valor maximo que podes almacenar en AX es que la suma de su sucesion sea mas grande a `65535 = (2^16) - 1`