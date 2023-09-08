          TIMER EQU 10H
          PIC EQU 20H
          EOI EQU 20H
          N_F10 EQU 1
          N_CLK EQU 2
          
          ORG 4
          IP_F10 DW RUT_F10
          
          ORG 8
          CLK_START DW START

          ORG 1000h
          SEG DB '0'
              DB '0'
              DB ' '
          FIN DB ?

          ORG 3000H
   START: PUSH AX ; Guardo AX
          INC SEG + 1 ; Incremento la unidad
          CMP SEG + 1, 3AH ; Comparo con el siguiente a '9'
          JNZ RESET ; Mientras no sean iguales no incremento la decena
          MOV SEG + 1, '0' ; De lo contrario, reseteo la unidad
          INC SEG ; Incremento la decena
          CMP SEG, '3' ; Comparo con 3 la decena
          JNZ RESET ; Si no son iguales, no paro
          PUSH AX ; Guardo AX
          MOV AL, 11111110b ; Enmascaro INT1
          OUT PIC + 1, AL ; PIC: registro IMR
          POP AX ; Restauro AX
   RESET: INT 7
          MOV AL, 0
          OUT TIMER, AL
          MOV AL, EOI
          OUT PIC, AL
          POP AX
          IRET

          
 RUT_F10: PUSH AX ; Guaro AX
          IN AL, PIC + 1
          CMP AL, 11111110B
          JZ RESTART ; Si son iguales significa que INT0 esta enmascarado y el timer esta frenado

          ; STOP
          MOV AL, 11111110b ; Enmascaro INT1
          OUT PIC + 1, AL ; PIC: registro IMR
          JMP RET_F10

 RESTART: MOV SEG, '0' ; Restarteo segundos
          MOV SEG + 1, '0'
          MOV AL, 11111100b ; Desenmascaro INT1
          OUT PIC + 1, AL ; PIC: registro IMR
          MOV AL, 0 ; Reseteo timer
          OUT TIMER, AL ; Timer: registro CONT
          
 RET_F10: MOV AL, EOI
          OUT PIC, AL
          POP AX
          IRET

          ORG 2000h
          CLI
          MOV AL, 11111100B
          OUT PIC + 1, AL ; PIC: registro IMR
          MOV AL, N_F10
          OUT PIC + 4, AL ; PIC: Registro INT0
          MOV AL, N_CLK
          OUT PIC + 5, AL ; PIC: registro INT1
          MOV AL, 1
          OUT TIMER + 1, AL ; TIMER: registro COMP
          MOV AL, 0
          OUT TIMER, AL ; TIMER: registro CONT
          MOV BX, OFFSET SEG
           MOV AL, OFFSET FIN - OFFSET SEG
          STI
    LOOP: JMP LOOP
          INT 0
          END
