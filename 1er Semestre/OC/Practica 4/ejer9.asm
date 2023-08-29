ORG 1000H
TABLA DB 2,4,6,8,10,12,14,16,18,20
FIN DB ?
TOTAL DB ?
MAX DB 2

ORG 2000H
MOV AL, 0
MOV CL, OFFSET FIN - OFFSET TABLA
MOV BX, OFFSET TABLA
MOV CH, MAX

MAX: CMP CH, [BX] ; Le resto el menor al maximo, si da positivo es que es menor o igual
JNS MAYOR  ; [BX] <= MAX
JMP ELSE

MAYOR: INC AL
ELSE: INC BX
DEC CL
JNZ MAX ; Hasta que CL sea 0
MOV TOTAL, AL
HLT
END