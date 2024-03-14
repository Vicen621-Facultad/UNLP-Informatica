; Escribir un programa para WinMips que genere un arreglo llamado res, cuyos elementos
; sean el resultado de calcular la funcion f=(a+b)/c^2, siendo a, b y c tres arreglos de datos
; en punto flotante de 5 elementos cada uno, almacenados en memeoria. Es decir, se deben hacer
; 5 operaciones (una por cada posicion). El calculo se debe realizar en una subrutina.
; El arreglo res debe almacenarce a continuacion del arreglo c

            .data
a:          .double 1.3, 3.5, 5.0, 1.9, 2.7
b:          .double 7.1, 3.4, 9.0, 1.0, 5.8
c:          .double 2.3, 4.2, 0.5, 1.1, 2.9
res:        .double 0.0, 0.0, 0.0, 0.0, 0.0

            .code
            daddi $s0, $0, 0        ; desplazamiento para las tablas
            daddi $s1, $0, 5        ; Contador
loop:       jal calculo
            daddi $s0, $s0, 8
            daddi $s1, $s1, -1
            bnez $s1, loop
            halt

; s0 = desplazamiento de las tablas
calculo:    l.d f0, a($s0)        ; f0 = a
            l.d f1, b($s0)        ; f1 = b
            l.d f2, c($s0)        ; f2 = c

            add.d f3, f0, f1      ; f3 = a+b
            mul.d f4, f2, f2      ; f4 = c^2
            div.d f5, f0, f2      ; f5 = (a+b)/c^2
            s.d f5, res($s0)
            jr $ra