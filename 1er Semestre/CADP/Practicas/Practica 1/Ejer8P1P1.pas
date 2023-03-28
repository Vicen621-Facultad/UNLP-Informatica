program Ejer8P1P1;

var
	vocal1, vocal2, vocal3: char;
	esVocal1, esVocal2, esVocal3: boolean;

BEGIN
	readln(vocal1);
	readln(vocal2);
	readln(vocal3);
	
	esVocal1 := (vocal1 = 'a') or (vocal1 = 'e') or (vocal1 = 'i') or (vocal1 = 'o') or (vocal1 = 'u');
	esVocal2 := (vocal2 = 'a') or (vocal2 = 'e') or (vocal2 = 'i') or (vocal2 = 'o') or (vocal2 = 'u');
	esVocal3 := (vocal3 = 'a') or (vocal3 = 'e') or (vocal3 = 'i') or (vocal3 = 'o') or (vocal3 = 'u');
	
	if (esVocal1 and esVocal2 and esVocal3) then
		writeln('Los tres son vocales')
	else
		writeln('Al menos un caracter no era vocal');
END.

