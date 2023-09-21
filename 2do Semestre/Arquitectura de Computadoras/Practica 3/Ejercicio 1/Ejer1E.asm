            PB EQU 31h
            CB EQU 33h
            PIC EQU 20h
            TIMER EQU 10h
            DER EQU 1
            IZQ EQU 2
    
            ORG 4h
            IP_DER DW RUT_DER
            
            ORG 8h
            IP_IZQ DW RUT_IZQ

            ORG 3000h
; Recibe valor por CL
; Devuelve valor corrido un bit a la izquierda por CL
 ROTAR_IZQ: PUSH AX
            ADD CL, CL ; corro el bit una vez a la izquierda
            JNS FIN_IZQ ; Si hay signo significa que se llego al bit7

            ; Si llego al bit0 cambio la interrupcion 
            ; para empezar a mover a la derecha
            CLI
            MOV AL, DER
            OUT PIC + 5, AL ; PIC: INT1
            STI

   FIN_IZQ: POP AX
            RET


; Recibe valor por CL
; Devuelve valor corrido un bit a la derecha, por CL
 ROTAR_DER: PUSH AX
            MOV AL, 7
            
  LOOP_DER: ADD CL, CL ; Muevo el bit una vez a la izquierda
            JNC NCARRY ; Si hay carry significa que me pase entonces le sumo 1
            INC CL
    NCARRY: DEC AL ; Si no hay carry decremento AL para llevar la cuenta
            JNZ LOOP_DER

            CMP CL, 1 ; Comparo AL con 1 para saber si ya se llego al bit0
            JNZ FIN_DER

            ; Si llego al bit0 cambio la interrupcion 
            ; para empezar a mover a la izquierda otra vez
            CLI 
            MOV AL, IZQ
            OUT PIC + 5, AL ; PIC: INT1
            STI
            
   FIN_DER: POP AX
            RET
            

   RUT_IZQ: PUSH AX
            IN AL, PB ; Guardo el valor actual de PB en AL
            MOV CL, AL ; Lo muevo a CL para llamar a la subrutina
            CALL ROTAR_IZQ
            MOV AL, CL ; Muevo lo que devolvio la subrutina en AL 
            OUT PB, AL

            MOV AL, 0
            OUT TIMER, AL ; Reinicio timer

            MOV AL, PIC
            OUT PIC, AL ; EOI = End of instruction
            POP AX
            IRET

   RUT_DER: PUSH AX
            IN AL, PB ; Guardo el valor actual de PB en AL
            MOV CL, AL ; Lo muevo a CL para llamar a la subrutina
            CALL ROTAR_DER
            MOV AL, CL ; Muevo lo que devolvio la subrutina en AL 
            OUT PB, AL

            MOV AL, 0
            OUT TIMER, AL ; Reinicio timer

            MOV AL, PIC
            OUT PIC, AL ; EOI = End of instruction
            POP AX
            IRET

            ORG 2000h
            CLI
            MOV AL, 11111101b
            OUT PIC + 1, AL ; PIC: IMR
            MOV AL, IZQ
            OUT PIC + 5, AL ; PIC: INT1
            
            MOV AL, 00000000b
            OUT CB, AL ; Configuro PB de salida
            MOV AL, 1 
            OUT PB, AL ; Inicializo PB en 1
            
            MOV AL, 1
            OUT TIMER + 1, AL ; TIMER: COMP
            MOV AL, 0
            OUT TIMER, AL ; TIMER: CONT
            STI
            
      LOOP: JMP LOOP ; Loop infinito
            INT 0
            END