      org 1000h
      DIVIDENDO DB 10
      DIVISOR DB 3
      RES DB ?

      org 3000h
; Esta subrutina recibe el divisor y dividendo por valor en AH y AL, en ese orden
; Modifica el valor de la dir de memoria pasada en BX con el resto de la division
 RESTO: CMP AH, AL ; Comparo para ver si el AH es mas chico que AL sin almacenar el resultado en AH
        JS FIN ; Si es negativo termino el loop
        SUB AH, AL ; Le resto el divisor al dividendo
        JMP RESTO
   FIN: MOV [BX], AH ; Guardo el resto en RESTO
        RET


      ORG 2000h
      MOV AH, DIVIDENDO
      MOV AL, DIVISOR
      MOV BX, OFFSET RES
      CALL RESTO
      HLT
      END