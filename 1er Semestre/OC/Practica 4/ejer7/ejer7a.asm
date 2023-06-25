; INCISO A (A <= B)
ORG 1000h ; Variables
A db 4
B db 2
C db 0

ORG 2000h ; Codigo
MOV AL, A
MOV BL, B
MOV CL, C

CMP BL, AL ; Le resto el menor al mayor, va a dar negativo solo si A > B
JNS CARGOA ; A <= B (Mientras no sea negativo S = 0)

MOV CL, BL; else
JMP FIN

CARGOA: MOV CL, AL
FIN: HLT
END