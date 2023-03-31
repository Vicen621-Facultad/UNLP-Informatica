{Ejemplo con 3 dias por mes}
PROGRAM Ejer8P1P2;

VAR
    day: integer;
    sellsDay, total, value: real;    

BEGIN
    total := 0;

    for day := 1 to 31 do BEGIN
        writeln('Indique las ventas para el dia: ', day);
        
        readln(value);

        sellsDay := 0;

        while (value <> 0) do BEGIN
            sellsDay := sellsDay + value;
            total := total + value;

            readln(value);
        END;

        writeln('Ventas del dia ', day, ': ', sellsDay);
    END;

    writeln('Ventas totales: ', total);
END.