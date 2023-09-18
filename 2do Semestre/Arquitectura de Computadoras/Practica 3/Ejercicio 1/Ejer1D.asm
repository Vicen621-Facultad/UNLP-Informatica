          PIC EQU 20h
          TIMER EQU 10h
          PB EQU 31h
          CB EQU 33h
          N_CLK EQU 1

          ORG 4
          IP_CLK DW RUT_CLK

          ORG 3000h
 RUT_CLK: PUSH AX
          CMP CL, 0FFh
          JZ FIN_CLK
          INC CL
          MOV CH, CL
          MOV AL, CL
          OUT PB, AL
 FIN_CLK: MOV AL, 0
          OUT TIMER, AL ; Pongo CONT en 0
          MOV AL, PIC
          OUT PIC, AL ; EOI
          POP AX
          IRET

          ORG 2000h
          CLI
          MOV AL, 11111101b
          OUT PIC + 1, AL ; Mascara para clock
          
          MOV AL, N_CLK
          OUT PIC + 5, AL ; PIC: Registro INT1
          
          MOV AL, 1
          OUT TIMER + 1, AL ; TIMER: Registro COMP
          
          MOV AL, 0
          OUT CB, AL ; Configuro PB de entrada
          
          MOV CL, 0 ; Inicializo CL en 0 para empezar a contar
          OUT PB, AL ; Apago todas las luces para empezar a contar

          MOV AL, 0
          OUT TIMER, AL ; Timer: Registro CONT
          STI
    
    POLL: CMP CL, 0FFh
          JNZ POLL
          
          INT 0
          END