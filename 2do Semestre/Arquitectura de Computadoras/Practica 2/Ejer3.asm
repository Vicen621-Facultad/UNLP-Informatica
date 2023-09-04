      ORG 2000h
      MOV BX, 1000h ; Lugar default vars
      MOV AL, 1 ; Un solo caracter
      
      MOV CL, 'a'
      MOV CH, 'A'

LOOP: MOV [BX], CH ; Muevo la letra mayuscula a 1000h
      INC CH ; Paso a la siguiente letra mayuscula
      INT 7 ; imprimo mayuscula
      MOV [BX], CL ; Muevo la letra minuscula a 1000h
      INC CL ; Paso a la siguiente letra minuscula
      INT 7 ; Imprimo minuscula
      CMP CL, '{' ; Comparo con el siguiente caracter a la Z
      JNZ LOOP

      INT 0
      END