program Ejer2P3;

type
    subDay = 1..31;
    subMonth = 1..12;

    date = record
        day: subDay;
        month: subMonth;
        year: integer;
    end;

procedure readDate(var dat: date);
    begin
        writeln('Ingrese el dia'); readln(dat.day);
        writeln('Ingrese el mes'); readln(dat.month);
        WriteLn('Ingrese el año'); ReadLn(dat.year);
    end;

function isInSummer(dat: date): boolean;
    begin
        isInSummer := dat.month <= 3
    end;

function isInFirstDays(dat: date): boolean;
    begin
        isInFirstDays := dat.day <= 10;
    end;

var
    cantSummer, cant10Days: integer;
    marriage: date;

begin
    cantSummer := 0; cant10Days := 0;

    readDate(marriage);
    while(marriage.year = 2019) do begin
        if (isInSummer(marriage)) then
            cantSummer := cantSummer + 1;
        
        if (isInFirstDays(marriage)) then
            cant10Days := cant10Days + 1;
        
        readDate(marriage);
    end;

    WriteLn('Se hicieron ', cantSummer, ' casamientos en verano');
    WriteLn('Se hicieron ', cant10Days, ' casamientos en los primeros 10 días del mes');
end.