program ejer4P1P2;

var
    valor, i, minimo1, minimo2 : integer;

BEGIN
    minimo1 := 32767;
    minimo2 := 32767;

    for i := 1 to 1000 do BEGIN
        readln(valor);
        
        if (valor < minimo1) then BEGIN
            minimo2 := minimo1;
            minimo1 := valor;
        END
        else if (valor < minimo2) then
            minimo2 := valor;
    END;

    writeln('Los numeros mas chicos fueron: ', minimo1, ' ', minimo2)
END.