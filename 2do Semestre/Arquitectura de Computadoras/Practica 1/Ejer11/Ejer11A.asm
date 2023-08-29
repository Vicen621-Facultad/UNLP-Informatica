      org 1000h
      DIVIDENDO DB 10
      DIVISOR DB 3
      RESULTADO DB ?

      org 3000h
; Esta subrutina recibe el divisor y dividendo por valor por la pila en ese orden
; Devuelve el resultado en el parametro del divisor
 DIV: PUSH BX ; Guardo BX
      PUSH CX ; Guardo CX
      PUSH AX ; Guardo AX

      MOV BX, SP
      ADD BX, 8 ; Le sumo 8, 3 registros + IP
      MOV AH, [BX] ; AH = DIVIDENDO (10)
      ADD BX, 2
      MOV AL, [BX] ; AL = DIVISOR (3)

      MOV CX, 0 ; Inicializo CX en 0
LOOP: SUB AH, AL ; Le resto el divisor al dividendo
      JS FIN ; Si es negativo termino el loop
      INC CX ; En caso contrario incremento CX y salto otra vez
      JMP LOOP
    
 FIN: MOV [BX], CX ; Guardo el resultado en el primer parametro
      POP AX ; Restauro AX
      POP CX ; Restauro CX
      POP BX ; Restauro BX
      RET


      ORG 2000h
      MOV AX, 0 ; Limpio AX
      MOV AL, DIVISOR
      PUSH AX ; Pusheo el divisor
      MOV AL, DIVIDENDO
      PUSH AX ; Pusheo el dividendo
      CALL DIV
      POP AX ; Saco el dividendo
      POP AX ; Saco el resultado
      MOV RESULTADO, AL
      HLT
      END