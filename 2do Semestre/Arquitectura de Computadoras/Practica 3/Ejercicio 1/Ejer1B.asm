       PA equ 30h
       CA equ 32h
      
       ORG 1000h
       MSJ_ON DB "Llave Prendida"
       MSJ_OFF DB "Llave Apagada"
       MSJ_FIN DB ?
      
       ORG 2000h
       MOV AL, 11111111b
       OUT CA, AL ; Inicializo CA para que sean todos bits de entrada

       IN AL, PA
       AND AL, 10000000b
       JNZ ON
       MOV BX, OFFSET MSJ_OFF
       MOV AL, OFFSET MSJ_FIN - OFFSET MSJ_OFF
       JMP PRINT

   ON: MOV BX, OFFSET MSJ_ON
       MOV AL, OFFSET MSJ_OFF - OFFSET MSJ_ON
       
PRINT: INT 7
       INT 0
       END