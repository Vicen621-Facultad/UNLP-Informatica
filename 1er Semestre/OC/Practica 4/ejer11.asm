ORG 1000h
DIR dw 1020h
MAX dw 20

ORG 2000h
MOV AX, 0
MOV BX, DIR ; Muevo DIR a BX Para poder usar a BX como puntero

CARGAR: MOV [BX], AX
ADD BX, 2 ; Incremento a BX en 2 ya que cada una de las celdas de la tabla ocupa 2 slots de memoria
ADD AX, 5
CMP MAX, AX ; Le resto el menor al mayor, va a dar negativo solo si MAX > AX
JNS CARGAR ; AX <= MAX (Mientras no sea negativo S = 0)
HLT
END