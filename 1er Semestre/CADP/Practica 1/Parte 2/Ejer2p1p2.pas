program Ejer2p1p2;

var
    mayor, valor, i, posicion: integer;

BEGIN
    mayor := -1;
    posicion := 0;
    for i := 1 to 10 do BEGIN
        readln(valor);
        if valor > mayor then BEGIN
            mayor := valor;
            posicion := i;
        END;
    END;

    writeln('El mayor numero leido fue el ', mayor, ' en la posicion ', posicion);
END.