        ORG 1000h
        PSWD DB "Hola"
        CLAVE DB ?
        PER DB "Acceso Permitido"
        DEN DB "Acceso Denegado"
        FIN_DEN DB ?

        ORG 3000h
  LEER: MOV CL, -1 ; Inicializo en -1 ya que incrementa al entrar
  LOOP: INC CL
        CMP CL, DL ; Comparo con DL para saber cuantos caracteres voy leyendo
        JZ PERM ; Si es 0 significa que termine de leer y permito acceso
        INT 6
        CALL COMP ; Devuelve ff en AL si los caracteres son iguales
        CMP AL, 0FFh
        JZ LOOP ; si la comparacion da 0 significa que el caracter es igual. Sigo comparando
        JMP DENE
  PERM: MOV BX, OFFSET PER
        MOV AL, OFFSET DEN - OFFSET PER
        INT 7
        JMP FIN

  DENE: MOV BX, OFFSET DEN
        MOV AL, OFFSET FIN_DEN, OFFSET DEN
        INT 7
   FIN: RET

  COMP: PUSH BX ; Guardo BX
        MOV BX, OFFSET PSWD
        ADD BX, DL ; Le sumo DL al offset de pswd para obtener el caracter a comparar
        MOV AH, CLAVE
        CMP [BX], AH ; Comparo el caracter leido con el caracter actual
        JZ ZERO
        MOV AL 00h ; Si no son igual, guardo 00 en AL para indicar que son diferentes
        JMP FIN2
  ZERO: MOV AL, 0FFh ; Si son iguales, guado FF en AL para indicarlo
   FIN: POP BX ; Restauro BX
        RET

        ORG 2000h
        MOV DL, 4
        MOV BX, OFFSET CLAVE
        CALL LEER
        INT 0
        END