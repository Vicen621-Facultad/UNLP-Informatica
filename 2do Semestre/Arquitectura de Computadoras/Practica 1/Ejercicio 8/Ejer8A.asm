ORG 1000h
TEST DB "abcd"
ZERO db 0h

ORG 3000h
; Recibe la referencia en BX y devuelve el resultado en CX
; Cuenta la cantidad de caracteres en un string hasta que llegue el valor 00h
LONGITUD: MOV CX, 0 ; Inicializa CX en 0
LOOP: CMP [BX], 0 ; Compara [BX] con 0 para ver si termino el programa
JZ FIN ; Si es 0 el [BX] = 0 y termina el programa
INC CX ; Si no termino incrementa CX (Cantidad de caracteres)
INC BX ; Incrementa BX para contar el siguiente caracter
JMP LOOP
FIN: RET

ORG 2000h
MOV BX, OFFSET TEST
CALL LONGITUD
HLT
END