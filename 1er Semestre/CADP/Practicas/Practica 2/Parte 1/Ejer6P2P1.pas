program Ejer6P2P1;

procedure numeroParMasAlto;
    var
        value, max: integer;
    begin
        max := -1;

        readln(value);
        while(value >= 0) begin
            readln(value);
            if (value MOD 2 = 0) and (value > max) then
                max := value;
        end;

        writeln('El numero par mas alto fue: ', max);
    end;

begin
    numeroParMasAlto;
end.
