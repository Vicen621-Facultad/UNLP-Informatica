program Ejer5P1P1;

var 
	num, doble, i: integer;

BEGIN
	readln(num);
	for i := 1 to 10 do BEGIN 
		readln(doble);
		if (doble = num*2) then BEGIN
			writeln('Se encontro el doble del numero');
			break;
		END
	END;
	if (doble <> num*2) then
		writeln('No se encontro el doble del numero en los datos ingresados')
END.

