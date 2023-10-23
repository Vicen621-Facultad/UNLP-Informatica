        .data
base:   .double 5.85
altura: .double 13.47
medio:  .double 0.5 
area:   .double 0

        .text
        l.d f0, base($0)
        l.d f1, altura($0)
        l.d f2, medio($0)

        mul.d f3, f0, f1 # base x altura
        mul.d f3, f3, f2 # (base x altura) / 2

        s.d f3, area($0)
        halt
