; INCISO B (A = B)
ORG 1000h ; Variables
A db 4
B db 2
C db 0

ORG 2000h ; Codigo
MOV AL, A
MOV BL, B
MOV CL, C

CMP AL, BL ; Resto los dos numeros, si da 0 son iguales
JZ CARGOA ; A = B (Mientras sea 0 z = 0)

MOV CL, BL; else
JMP FIN

CARGOA: MOV CL, AL
FIN: HLT
END