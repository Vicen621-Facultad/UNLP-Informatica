        .data
tabla:  .word 20, 1, 14, 3, 2, 58, 18, 7, 12, 11
num:    .word 7
long:   .word 10
        
        .text
        ld r1, long($0)
        ld r2, num($0)
        dadd r3, $0, $0
        dadd r10, $0, $0

loop:   ld r4, tabla(r3)
        beq r4, r2, listo
        daddi r1, r1, -1
        daddi r3, r3, 8
        bnez r1, loop
        j fin
        
listo:  daddi r10, $0, 1
fin:    halt 
