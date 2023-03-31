program ejer4P1P2A;

var
    valor, minimo1, minimo2 : integer;

BEGIN
    minimo1 := 32767;
    minimo2 := 32767;

    readln(valor);
    
    while (valor <> 0) do BEGIN
        if (valor < minimo1) then BEGIN
            minimo2 := minimo1;
            minimo1 := valor;
        END
        else if (valor < minimo2) then
            minimo2 := valor;
        
        readln(valor);
    END;

    writeln('Los numeros mas chicos fueron: ', minimo1, ' ', minimo2)
END.