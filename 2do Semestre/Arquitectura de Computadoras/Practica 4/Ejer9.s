        .data
a:      .word 7 # A siempre empieza siendo > 0
x:      .word 0
y:      .word 1

        .text
        ld $t0, a($0)
        ld $t1, x($0)
        ld $t2, y($0)

loop:   daddi $t0, $t0, -1
        bnez $t0, loop
        dadd $t1, $t1, $t2

fin:    sd $t0, a($0)
        sd $t1, x($0)
        sd $t2, y($0)
        halt