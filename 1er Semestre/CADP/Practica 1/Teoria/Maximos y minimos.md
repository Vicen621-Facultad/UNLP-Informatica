Se usa una variable para seguir el rastro del actual maximo o minimo. La variable se tiene que inicializar al principio del programa.
Maximos -> Se inicializa en el menor valor posible
Minimos -> Se inicializa en el mayor valor posible

Ej: Hacer un programa que obtenga el minimo y maximo valor ingresado. Se dejan de leer numeros cuando el numero ingresado sea el 0 (el cual no se tiene que procesar). Los numeros ingresados solo pueden ser entre el 0 y el 100.
```pascal
program MaxMinEx;
type
	num = -1..101;
var
	max, min, value: num;
begin
	max := -1;
	min := 101;
	
	readln(value);
	while (value <> 0) do begin
		if (value > max) then
			max := value;

		if (value < min) then
			max := value;

		readln(value);
	end;

	writeln('El minimo valor ingresado fue: ', min, ' y el maximo: ', max);
end.
```