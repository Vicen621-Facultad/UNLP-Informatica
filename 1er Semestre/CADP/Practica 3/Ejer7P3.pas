program Ejer7P3;

type
    center = record
        name, university: string;
        investigators, scholars: integer;
    end;

procedure readCenter(var cent: center);
    begin
        writeln('Ingrese el nombre del centro'); readln(cent.name);
        WriteLn('Ingrese la universiad'); readln(cent.university);
        WriteLn('Ingrese la cantidad de investigadores'); readln(cent.investigators);
        WriteLn('Ingrese la cantidad de becarios'); readln(cent.scholars);
    end;

procedure twoMinimums(scholars: integer; centName: string; var min1, min2: integer; var nameMin1, nameMin2: string);
    begin
        if (scholars < min1) then begin
            min2 := min1;
            nameMin2 := nameMin1;

            min1 := scholars;
            nameMin1 := centName;
        end
        else if (scholars < min2) then begin
            min2 := scholars;
            nameMin2 := centName;
        end;
    end;

procedure maximum(investigators: integer; name: string; var max1: integer; var nameMax1: string);
    begin
        if (investigators > max1) then begin
            max1 := investigators;
            nameMax1 := name;
        end;
    end;

var
    totalCenters, max1, min1, min2, totalInvestigators: integer;
    nameMax1, nameMin1, nameMin2: string;
    currentUni: string;
    cent: center;

begin
    max1 := -1;
    min1 := 999;

    readCenter(cent);
    while (cent.investigators > 0) do begin
        totalCenters := 0;
        totalInvestigators := 0;
        currentUni := cent.university;

        while (cent.investigators > 0) and (currentUni = cent.university) do begin
            totalCenters := totalCenters + 1;
            totalInvestigators := totalInvestigators + cent.investigators;

            twoMinimums(cent.scholars, cent.name, min1, min2, nameMin1, nameMin2);
            readCenter(cent);
        end;

        maximum(totalInvestigators, currentUni, max1, nameMax1);
        writeln('Cantidad de centros para la univesidad ', currentUni, ': ', totalCenters);
    end;

    writeln('Universidad con mas investigadores: ', nameMax1, ' (', max1, ')');
    writeln('Centros con menor cantidad de becarios: ', nameMin1, ' ', nameMin2)
end.