              PIC EQU 20h
              DATA EQU 40h
              STATE EQU 41h
              N_HAND_FW EQU 1
              N_HAND_BW EQU 2
    
              ORG 4
              IP_HAND_FW DW RUT_HAND_FW

              ORG 8
              IP_HAND_BW DW RUT_HAND_BW
              
              ORG 1000h
              MSJ DB ?

    
              ORG 3000h
    ; Recibe el caracter a imprimir por BX
    IMPRIMIR: PUSH AX
              MOV AL, [BX]
              OUT DATA, AL
              POP AX
              RET
              
 RUT_HAND_FW: PUSH AX
              CMP CL, 0
              JZ FIN_FW
              CALL IMPRIMIR
              INC BX
              DEC CL
    
      FIN_FW: MOV AL, 20h
              OUT PIC, AL ; EOI
              POP AX
              IRET

 RUT_HAND_BW: PUSH AX
              CALL IMPRIMIR
              DEC BX
              DEC CL
    
              MOV AL, 20h
              OUT PIC, AL ; EOI
              POP AX
              IRET

    
              ORG 2000h
              MOV CL, 5
              MOV BX, OFFSET MSJ
              
   LOOP_READ: INT 6
              INC BX
              DEC CL
              JNZ LOOP_READ
              
              CLI
              MOV AL, 11111011b
              OUT PIC + 1, AL ; PIC: IMR
    
              MOV AL, N_HAND_FW
              OUT PIC + 6, AL ; PIC: INT2
              
              IN AL, STATE
              OR AL, 80h
              OUT STATE, AL ; Configuro HAND por interrupcion

              MOV BX, OFFSET MSJ
              MOV CL, 5
              STI
    
     LOOP_FW: CMP CL, 0
              JNZ LOOP_FW

              CLI
              MOV AL, N_HAND_BW
              OUT PIC + 6, AL ; PIC: INT2
              
              MOV BX, 1004h
              MOV CL, 5
              STI

     LOOP_BW: CMP CL, 0
              JNZ LOOP_BW
              INT 0
              END