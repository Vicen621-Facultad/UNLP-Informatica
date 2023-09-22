          STATE EQU 41h
          DATA EQU 40h
  
          ORG 1000h
          MSJ DB "INGENIERIA E INFORMATICA"
          FIN_MSJ DB ?

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
          IN AL, STATE
          AND AL, 01111111b
          OUT STATE, AL ; Configuro HAND por polling

          MOV BX, OFFSET MSJ
          MOV CL, OFFSET FIN_MSJ - OFFSET MSJ

    LOOP: CALL IMPRIMIR
          INC BX
          DEC CL
          JNZ LOOP
          INT 0
          END