program Ejer4P1P1;

var 
	num, doble: integer;

BEGIN
	readln(num);
	readln(doble);
	while (doble <> num*2) do
		readln(doble);
	writeln('Se encontro el doble del numero!');
END.

