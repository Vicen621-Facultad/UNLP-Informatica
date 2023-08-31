program ejer2;

procedure imprimirNumero(num: integer);
var
	resto: integer;
begin
	if (num <> 0) then begin
		resto := num MOD 10;
		num := num DIV 10;
		
		imprimirNumero(num);
		writeln(resto);
	end;
end;

begin
	imprimirNumero(256);
end.
