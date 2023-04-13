program Ejer9P1P1;

var 
	operador: char;
	num, total: integer;

BEGIN
	writeln('Ingrese + o -');
	readln(operador);
	
	if (operador = '+') then BEGIN
		readln(num);
		total := num;
		while (num <> 0) do BEGIN
			readln(num);
			total := total + num;
		END;
		writeln('El total de la suma es: ', total);
	
	END
	else if (operador = '-') then BEGIN
		readln(num);
		total := num;
		while (num <> 0) do BEGIN
			readln(num);
			total := total - num;
		END;
		writeln('El total de la resta es: ', total);
	
	END
	else
		writeln('El caracter introducido no corresponde a un operador');
END.

