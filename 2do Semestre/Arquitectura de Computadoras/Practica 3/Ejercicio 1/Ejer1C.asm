      PA equ 30h
      PB equ 31h
      CA equ 32h
      CB equ 33h

      ORG 2000h
      MOV AL, 0FFh
      OUT CA, AL ; Configuro PA de entrada

      MOV AL, 0
      OUT CB, AL ; Configuro PB de salida

LOOP: IN AL, PA
      OUT PB, AL
      JMP LOOP
      
      END