; PUNTO 7 (A < B)
ORG 1000h ; Variables
A db 2
B db 4
C db 0

ORG 2000h ; Codigo
MOV AL, A
MOV BL, B
MOV CL, C

CMP AL, BL ; Le resto el mayor al menor, va a dar negativo siempre que A < B
JS CARGOA ; A < B (Mientras sea negativo S = 1)

MOV CL, BL; else
JMP FIN

CARGOA: MOV CL, AL
FIN: HLT
END