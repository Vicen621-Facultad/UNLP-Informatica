              PIC EQU 20h
              DATA EQU 40h
              STATE EQU 41h
              
              ORG 1000h
              MSJ DB ?
    

              ORG 3000h
    ; Recibe el caracter a imprimir por BX
    IMPRIMIR: PUSH AX
        POLL: IN AL, STATE
              AND AL, 1
              JNZ POLL
    
              MOV AL, [BX]
              OUT DATA, AL
              POP AX
              RET

    
              ORG 2000h
              MOV CL, 5 ; 5 caracteres por leer
              MOV BX, OFFSET MSJ
              
   LOOP_READ: INT 6
              INC BX
              DEC CL ; Cuando CL = 0 ya se leyeron 5 caracteres
              JNZ LOOP_READ
              
              IN AL, STATE
              AND AL, 01111111b
              OUT STATE, AL ; Configuro HAND por polling

              MOV BX, OFFSET MSJ
              MOV CL, 5 ; Cantidad de caracteres a imprimir
    
     LOOP_FW: CALL IMPRIMIR
              INC BX ; Paso al siguiente caracter
              DEC CL ; Mientras CL > 0 todavian quedan caracteres por imprimir
              JNZ LOOP_FW
              
              MOV BX, 1004h
              MOV CL, 5

     LOOP_BW: CALL IMPRIMIR
              DEC BX ; Paso al caracter anterior
              DEC CL ; Mientras CL > 0 todavian quedan caracteres por imprimir
              JNZ LOOP_BW
              INT 0
              END