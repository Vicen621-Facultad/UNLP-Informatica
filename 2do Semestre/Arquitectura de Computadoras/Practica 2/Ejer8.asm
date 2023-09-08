        ORG 1000h
        NUM1 DB ?
        NUM2 DB ?
        IMPRIMIR DB ?

        ORG 3000h
 PRINT: MOV BX, OFFSET IMPRIMIR
        MOV AL, 1
        SUB CL, CH ; Hago la resta
        JNS ES_POS ; Si no es negatico no hay que poner signo
        MOV [BX], '-' ; De lo contrario agrego el signo
        INC BX
        INC AL
        NEG CL ; Niego CL para obtener de nuevo el numero positivo y poder agarrar el caracter
ES_POS: ADD CL, 30h ; Obtengo caracter
        MOV [BX], CL
        MOV BX, OFFSET IMPRIMIR
        INT 7
        RET

        ORG 2000h
        MOV BX, OFFSET NUM1
        INT 6
        MOV BX, OFFSET NUM2
        INT 6
        MOV CL, NUM1
        MOV CH, NUM2
        CALL PRINT
        INT 0
        END