         TIMER EQU 10H
         PIC EQU 20H
         EOI EQU 20H
         N_CLK EQU 10
        
         ORG 40
         IP_CLK DW RUT_CLK
        
         ORG 1000H
         MIN DB '0'
             DB '0'
             DB ':'
         SEG DB '0'
             DB '0'
             DB ' '
         FIN DB ?

         ORG 3000H
RUT_CLK: PUSH AX ; Guardo AX
         INC SEG ; Incremento 10 segundos
         CMP SEG, '6' ; Comparo con 6 la decena de segundos
         JNZ RESET ; Mientras no sean iguales, no llego al minuto y no incremento
         MOV SEG, '0' ; De lo contrario, reseto los segundos a 0
         
         INC MIN + 1 ; Incremento la unidad de minutos
         CMP MIN + 1, 3AH ; Comparo con el siguiente a '9'
         JNZ RESET ; Mientras no sean iguales no incremento la decena
         MOV MIN + 1, '0' ; De lo contrario, reseteo la unidad de minutis
         INC MIN ; Incremento la decena
         CMP MIN, '6' ; Comparo con 6 la decena de minutos
         JNZ RESET ; Si no son iguales, no reseto
         MOV MIN, '0' ; de lo contrario reseto los minutos y vuelvo a empezar la siguiente hora
    
  RESET: INT 7
         MOV AL, 0
         OUT TIMER, AL ; Reseteo CONT a 0
         MOV AL, EOI 
         OUT PIC, AL
         POP AX ; Restauro AX
         IRET

         ORG 2000H
         CLI
         MOV AL, 11111101B
         OUT PIC + 1, AL ; PIC: registro IMR
         MOV AL, N_CLK
         OUT PIC + 5, AL ; PIC: registro INT1
         MOV AL, 10
         OUT TIMER + 1, AL ; TIMER: registro COMP
         MOV AL, 0
         OUT TIMER, AL ; TIMER: registro CONT
         MOV BX, OFFSET MIN
         MOV AL, OFFSET FIN - OFFSET MIN
         STI
   LAZO: JMP LAZO
         INT 0
         END 
