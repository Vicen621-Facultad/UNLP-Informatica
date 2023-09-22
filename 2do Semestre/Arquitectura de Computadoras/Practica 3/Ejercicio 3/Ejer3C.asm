          PIC EQU 20h
          DATA EQU 40h
          STATE EQU 41h
          N_HAND EQU 1

          ORG 4
          IP_HAND DW RUT_HAND
          
          ORG 1000h
          MSJ DB "UNIVERSIDAD NACIONAL DE LA PLATA"
          FIN_MSJ DB ?

          ORG 3000h
; Recibe el caracter a imprimir por BX
RUT_HAND: PUSH AX
          MOV AL, [BX] ; El caracter esta en BX
          OUT DATA, AL

          INC BX ; Paso al siguiente caracter
          DEC CL ; Decremento la cantidad que faltan imprimir

          MOV AL, 20h
          OUT PIC, AL ; EOI
          POP AX
          IRET

          ORG 2000h
          CLI
          MOV AL, 11111011b
          OUT PIC + 1, AL ; PIC: IMR

          MOV AL, N_HAND
          OUT PIC + 6, AL ; PIC: INT2
          
          IN AL, STATE
          OR AL, 80h
          OUT STATE, AL ; Configuro HAND por interrupcion

          MOV BX, OFFSET MSJ
          MOV CL, OFFSET FIN_MSJ - OFFSET MSJ
          STI

    LOOP: CMP CL, 0 ; mientras CL > 0 quedan caracteres por imprimir
          JNZ LOOP
          INT 0
          END