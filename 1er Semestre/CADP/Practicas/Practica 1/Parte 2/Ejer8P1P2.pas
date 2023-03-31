{Ejemplo con 3 dias por mes}
PROGRAM Ejer8P1P2;

VAR
    day, sells1, sells2, sells3, total, value: integer;    

BEGIN
    total := 0;

    sells1 := 0;
    sells2 := 0;
    sells3 := 0;

    for day := 1 to 3 do BEGIN
        writeln('Indique las ventas para el dia: ', day);
        
        readln(value);

        while (value <> 0) do BEGIN
            case day of
                1: sells1 := sells1 + value;
                2: sells2 := sells2 + value;
                3: sells3 := sells3 + value;
            END;

            total := total + value;

            readln(value);
        END;
    END;

    writeln('Ventas por dias: ');
    writeln('Dia 1: ', sells1);
    writeln('Dia 2: ', sells2);
    writeln('Dia 3: ', sells3);
    writeln(' ');
    writeln('Ventas totales: ', total);
END.