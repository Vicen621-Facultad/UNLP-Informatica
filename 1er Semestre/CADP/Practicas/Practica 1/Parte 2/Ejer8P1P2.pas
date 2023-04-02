PROGRAM Ejer8P1P2;

VAR
    day, sellsDay, total, value: integer;    

BEGIN
    total := 0;

    for day := 1 to 31 do BEGIN
        writeln('Indique las ventas para el dia: ', day);
        
        readln(value);
        sellsDay := 0;

        while (value <> 0) do BEGIN
            sellsDay := sellsDay + value;
            total := total + value;
            
            writeln('Ventas para el dia ', day, ': ', sellsDay);

            readln(value);
        END;
    END;

    writeln('Ventas totales: ', total);
END.