      PIC EQU 20h
      EOI EQU 20h
      N_F10 EQU 10
      
      ORG 40
      IP_F10 DW RAND

      ORG 1000h
      CAR DB ? ; Almaceno caracter
          DB ' '

      ORG 3000h
RAND: PUSH BX ; Guardo BX
      PUSH AX ; Guardo AX
      MOV BX, OFFSET CAR ; Muevo la dir de car para imprimirlo. Agus es mogolico y me cojo a su mama
      MOV AL, 2 ; Imprimo 2 caracteres
      INT 7 ; Imprimo los cars
      MOV AL, EOI ; Muevo 20h a AL para terminar la interrupcion
      OUT EOI, AL ; Muevo 20H al End Of Instruction
      POP AX ; Restauro AX
      POP BX ; Restauro BX
      IRET
      
      ORG 2000h
      CLI
      MOV AL, 11111110b
      OUT PIC + 1, AL ; Solo leo las int 0 = F10
      MOV AL, N_F10
      OUT PIC + 4, AL ; Asigno el valor a la int0
      STI
      
 INI: MOV CAR, 'A' ; Inicializo Car en A
LOOP: INC CAR ; Incremento Car para pasar al siguiente caracter
      CMP CAR, 'Z' ; Lo comparo con z para ver si termino
      JZ INI ; Si llego a la Z, vuelvo a la A
      JMP LOOP ; De lo contrario vuelvo a incrementar
      INT 0
      END