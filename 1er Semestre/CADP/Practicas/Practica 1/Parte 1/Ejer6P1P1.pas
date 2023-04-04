program Ejer6P1P1;

var 
	legajo, totalAlu, promedioMayor6, destacados: integer;
	prom: real;

BEGIN
	readln(legajo);
		
	totalAlu := 0;
	promedioMayor6 := 0;
	destacados := 0;
	while (legajo <> -1) do BEGIN
		if (legajo <> -1) then BEGIN
			readln(prom);
			totalAlu := totalAlu + 1;
			
			if (prom > 6.5) then
				promedioMayor6 := promedioMayor6 + 1;
			
			if (prom > 8.5) and (legajo < 2500) then
				destacados := destacados + 1;
		END;
		readln(legajo);
	END;
	
	writeln('Alumnos: ', totalAlu);
	writeln('Promedios mayor a 6.5: ', promedioMayor6);
	writeln('Porcenatje de alumnos destacados: ', destacados*100/totalAlu:1:2, '%');
END.

