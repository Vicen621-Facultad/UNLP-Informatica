        org 1000h
        MSJ DB 01h
  
        org 3000h
CARGAR: mov [BX], CL
        inc BX
        inc CL
        jnz CARGAR
        ret
    
        org 2000h
        mov BX, offset MSJ
        mov CL, MSJ
        call CARGAR
        mov BX, offset MSJ
        mov AL, 0FFh
        int 7
        int 0
        end