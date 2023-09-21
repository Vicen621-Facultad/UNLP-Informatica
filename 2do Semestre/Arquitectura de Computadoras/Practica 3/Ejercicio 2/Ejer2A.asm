        PIO EQU 30h

        ORG 1000h
        MSJ DB 'A'


        ORG 2000h
        MOV AL, 11111101b
        OUT PIO + 2, AL ; PIO: Registro CA
        MOV AL, 00000000b
        OUT PIO + 3, AL ; PIO: Registro CB

        IN AL, PIO ; PIO: Registro PA
        AND AL, 11111101b ; Fuerza 0 en pulso stribe
        OUT PIO, AL ; PIO: Registro PA

  POLL: IN AL, PIO
        AND AL, 00000001b ; 1 si esta ocupada, 0 si esta libre
        JNZ POLL

        MOV AL, MSJ
        OUT PIO + 1, AL ; PIO: Registro PB
        
        IN AL, PIO ; PIO: Registro PA
        OR AL, 00000010b ; Fuerzo 1 en strobe
        OUT PIO, AL ; PIO: Registro PA

        IN AL, PIO ; PIO: Resgistro PA
        AND AL, 11111101b ; Fuerzo 0 en strobe
        OUT PIO, AL ; PIO: Registro PA
        INT 0
        END