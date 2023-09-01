org 1000h
MSJ db "Agus y Vicen"
FIN db ?

org 2000h
mov BX, offset MSJ
mov AL, offset FIN - offset MSJ
int 7
int 0
end