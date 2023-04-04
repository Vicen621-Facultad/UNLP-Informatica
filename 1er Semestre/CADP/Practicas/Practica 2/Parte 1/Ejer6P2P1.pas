program Ejer6P2P1;

procedure numeroParMasAlto;
    var
        value, max: integer;
    begin
        max := -999;

        repeat
            readln(value);
            if (value MOD 2 = 0) and (value > max) then
                max := value;
        until value < 0;

        writeln('El numero par mas alto fue: ', max);
    end;

begin
    numeroParMasAlto;
end.