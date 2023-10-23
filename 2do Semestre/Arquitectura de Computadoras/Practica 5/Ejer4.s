        .data
peso:   .double 75.7
altura: .double 1.73
IMC:    .double 0
tabla:  .double 18.5, 25, 30
long:   .word 3
estado: .space 1

        .text
        l.d f1, altura($0)
        l.d f0, peso($0)

        mul.d f2, f1, f1    # f2 = (altura)^2
        div.d f3, f0, f2    # f3 = peso / (altura)^2

        s.d f3, IMC($0)

        ld $t0, long($0)
        daddi $t1, $0, 1    # $t1 = 1
        dadd $gp, $0, $0    # $gp = 0

loop:   l.d f4, tabla($gp)  # f4 = valor actual de la tabla
        daddi $gp, $gp, 1   # inc $gp
        c.lt.d f3, f4
        bc1t store          # si f3 < f4 guardo el valor de $t1 en estado
        daddi $t1, $t1, 1   # inc $t1
        bne $gp, $t0, loop # Mientras $gp < 3, loop

        daddi $t1, $t1, 1   #inc $t1

store:  sd $t1, estado($0)
        halt