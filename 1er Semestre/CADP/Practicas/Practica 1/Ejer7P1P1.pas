program Ejer7P1P1;

var 
	codigo: integer;
	price, newPrice: real;

BEGIN
	repeat
		readln(codigo);
		readln(price);
		readln(newPrice);
		
		if (newPrice > price*1.1) then
			writeln('El aumento de precio del producto ', codigo, ' es superior al 10%')
		else
			writeln('El aumento de precio del producto ', codigo, ' no supera el 10%');
	until(codigo = 32767);
END.

