program Ejer3p1p2;

type
    note = 1..10;

var
    aprobados, alumnos7: integer;
    nota: note;
    nombre: string;

BEGIN
    aprobados := 0;
    alumnos7 := 0;

    repeat
        readln(nombre);
        readln(nota);

        if (nota > 8) then
            aprobados := aprobados + 1;
        
        if (nota = 7) then
            alumnos7 := alumnos7 + 1;
    until nombre = 'Zidane Zinedine';

    writeln('Cantidad de alumnos aprobados: ', aprobados);
    writeln('Cantidad de alumnos con nota = 7: ', alumnos7);
END.