ORG 1000h
TEST DB "aBcDE1#!"
ZERO DB 0h

ORG 3000h
CONT: MOV CX, 0 ; Inicializo CX en 0
LOOP_CONT: CMP BYTE PTR [BX], 0h ; Comparo [BX] con 0 para ver si termino de ejecutarse
JZ FIN_CONT ; Si es 0 el programa termino
CALL COMP ; Llamo a COMP para que se fije si [BX] es minuscula
INC BX ; Incremento BX para pasar a la siguiente letra
JMP LOOP_CONT ; Llamo al loop otra vez
FIN_CONT: RET

; Recibe una dir de memoria en BX y la compara para ver si es minuscula
; Si es minuscula incrementa CX, de otra manera no hace nada
COMP: PUSH DX ; Guardo DX
MOV DL, 60h ; Guardo el caracter anterior a la 'a'

CMP DL, [BX] ; Lo comparo con el anterior a la 'a'
JS MAYOR ; Va a dar positivo solo si [BX] > 60
JMP FIN_COMP ; Si [BX] <= 60 el caracter no es una minuscula

MAYOR: MOV DL, 7Ah ; Guardo el caracter 'z' 
CMP DL, [BX] ; Lo comparo con la 'z' 
JNS SUM_COMP ; Va a dar negativo solo si [BX] <= 7A
JMP FIN_COMP ; Si 7B >= [BX] el caracter no es una minuscula

SUM_COMP: INC CX ; Incremento CX que es donde se esta guardando el resultado
FIN_COMP: POP DX ; Restauro DX
RET

org 2000h
MOV BX, OFFSET TEST
CALL CONT
HLT
END