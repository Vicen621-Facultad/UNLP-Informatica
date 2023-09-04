        org 1000h
        NUM1 DB ?
        NUM2 DB ?
        IMPRIMIR DB ?

        org 3000h
  ; Recibe en BX La direccion a la cual guardar lo ingresado
  ; Lee un numero y guarda el valor numerico del caracter
  LEER: INT 6 ; Leo caracter numerico
        MOV CL, [BX] ; Guardo en CL para operar
        SUB CL, 30h ; Le resto 30h para obtener el valor numero del caracter
        MOV [BX], CL ; Guardo el resultado en la dir pasada
        RET
        
 PRINT: MOV BX, OFFSET IMPRIMIR ; Muevo la dir de memoria de IMPRIMIR para guardar el primer valor
        MOV AL, 1 ; Inicializo AL en 1
        CMP CH, 10 ; Comparo CH con 10
        JS PRT_CH ; CH < 10, si es menor hay que imprimir un solo digito
        MOV BYTE PTR [BX], '1' ; De lo contrario hay que imprimir primero el digito 1
        SUB CH, 10 ; Le resto 10 para obtener el valor de la unidad
        INC BX ; Incremento BX para guardar en la siguiente dir de memoria
        INC AL ; Incremento AL porque hay que imprimir 2 caracters
PRT_CH: ADD CH, 30h ; Le sumo 30h a CH para obtener el caracter del numero
        MOV BYTE PTR [BX], CH ; Guardo el caracter en la direcion de memoria para imprimir
        MOV BX, OFFSET IMPRIMIR ; Muevo la dir de memoria de imprimir a BX para imprimir desde ahi
        INT 7 ; Imprimo
        RET


        org 2000h
        MOV BX, OFFSET NUM1 ; Guardo la dir de memoria de num1 para leer caracter 1
        CALL LEER
        MOV BX, OFFSET NUM2 ; Guardo la dir de memoria de num2 para leer caracter 2
        CALL LEER

        MOV CL, NUM1 ; Muevo Num1 a CL para operar
        MOV CH, NUM2 ; Muevo Num2 a CH para operar
        ADD CH, CL ; Sumo CH y CL y lo guardo en CL
        CALL PRINT
        int 0
        end