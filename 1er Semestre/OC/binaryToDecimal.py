binary = float(input('Ingresa el numero en binario'))
mode = input('Ingresa el sistema de representacion, posibles: bss, bcs, ca1, ca2 y ex2')
decimal = 0;
i = 0;

match mode:
    case 'bss':
        while binary > 0:
            decimal += (binary % 10)**i;
            ++i