PROGRAM Ejer7P1P2;

VAR
    pilTime, min1, min2, max1, max2, i: integer;
    pilName, min1Pil, min2Pil, max1Pil, max2Pil: string;

BEGIN
    min1 := 32767;
    min2 := 32767;

    max1 := -32767;
    max2 := -32767;

    {Inicializo la variable para que al 
    pasarla a min2Pil y max2Pil por 
    primera vez no de error}
    min1Pil := '0';
    max1Pil := '0';

    for i := 1 to 6 do BEGIN
        readln(pilName);
        readln(pilTime);

        if (pilTime < min1) then BEGIN
            min2 := min1;
            min2Pil := min1Pil;

            min1 := pilTime;
            min1Pil := pilName
        END
        else if (pilTime < min2) then BEGIN
            min2 := pilTime;
            min2Pil := pilName;
        END;

        if (pilTime > max1) then BEGIN
            max2 := max1;
            max2Pil := max1Pil;

            max1 := pilTime;
            max1Pil := pilName
        END
        else if (pilTime > max2) then BEGIN
            max2 := pilTime;
            max2Pil := pilName;
        END;
    END;

    writeln('1er y 2do puesto, respectivamente: ', min1Pil, ' y ', min2Pil);
    writeln('Anteultimo y ultimo puesto, respectivamente: ', max2Pil, ' y ', max1Pil);
END.