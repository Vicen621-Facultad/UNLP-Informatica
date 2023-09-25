            PIC EQU 20h
            TIMER EQU 10h
            N_F10 EQU 1
            N_CLK EQU 2

            ORG 4
            IP_F10 DW RUT_F10

            ORG 8
            IP_CLK DW RUT_CLK

            ORG 1000h
            NUM_D DB ? ; Decena
            NUM_U DB ? ; Unidad

            ORG 3000h
   RUT_F10: PUSH AX
            MOV AL 11111101b ; Desenmascaro timer, enmascaro f10
            OUT PIC + 1, AL ; PIC: IMR
            MOV AL, 0 ; Reseteo timer
            OUT TIMER, AL ; TIMER: CONT
            MOV AL, 20h
            OUT PIC, AL ; EOI
            POP AX
            IRET

   RUT_CLK: PUSH AX
            CMP NUM_U, '0' ; Si la unidad es distinta de 0, la decremento
            JNZ DEC_U
            MOV NUM_U, 3Ah ; si no, Le pongo el caracter siguiente a '9' a la unidad
            CMP NUM_D, '0' ; Si la unidad y la decena son 0 significa que termino de contar
            JNZ CLK_FIN
            DEC NUM_D ; Decremento la decena

     DEC_U: DEC NUM_U ; Decremento la unidad
            INT 7
            JMP CLK_RET

   CLK_FIN: MOV AL, 11111110b ; Enmascaro timer, desenmascaro f10
            OUT PIC + 1, AL ; PIC: IMR
    
   CLK_RET: MOV AL, 0 ; Reseteo timer
            OUT TIMER, AL ; TIMER: CONT
            MOV AL, 20h
            OUT PIC, AL ; EOI
            IRET
    
            ORG 2000h
            CLI
            MOV AL, 11111110b
            OUT PIC + 1, AL ; PIC: IMR
            MOV AL, N_F10
            OUT PIC + 4, AL ; PIC: INT1
            MOV AL, N_CLK
            OUT PIC + 5, AL ; PIC: INT2
            MOV AL, 1
            OUT TIMER + 1, AL ; TIMER: COMP
            STI

            MOV BX, OFFSET NUM_D
            INT 6 ; Leo decena
            INC BX 
            INT 6 ; Leo unidad
            DEC BX ; Acomodo BX para imprimir
            MOV AL, 2 ; Siempre se van a imprimir 2 caracteres
      LOOP: JMP LOOP ; Loop infinito
            INT 0
            END