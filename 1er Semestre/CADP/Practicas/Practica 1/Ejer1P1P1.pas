program Ejer1P1P1;
var
	num1, num2: integer;
begin
	readln(num1);
	readln(num2);
	
	if (num1 > num2) then
		writeln('Num 1 es mas grande')
	else if (num2 > num1) then
		writeln('Num2 es mas grande')
	else
		writeln('Los numeros leidos son iguales')
end.
