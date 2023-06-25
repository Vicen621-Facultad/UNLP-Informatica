; A < B
ORG 1000h ; Variables
A db 2
B db 4
C db 0

ORG 2000h ; Codigo
MOV AL, A
MOV BL, B
MOV CL, C

CMP AL, BL
JS CARGOA ; A < B 

MOV CL, BL; else
JMP FIN

CARGOA: MOV CL, AL
FIN: HLT
END

; A <= B
ORG 1000h ; Variables
A db 4
B db 2
C db 0

ORG 2000h ; Codigo
MOV AL, A
MOV BL, B
MOV CL, C

CMP BL, AL
JNS CARGOA ; A <= B 

MOV CL, BL; else
JMP FIN

CARGOA: MOV CL, AL
FIN: HLT
END

; A = B
ORG 1000h ; Variables
A db 4
B db 2
C db 0

ORG 2000h ; Codigo
MOV AL, A
MOV BL, B
MOV CL, C

CMP AL, BL
JZ CARGOA ; A = B 

MOV CL, BL; else
JMP FIN

CARGOA: MOV CL, AL
FIN: HLT
END