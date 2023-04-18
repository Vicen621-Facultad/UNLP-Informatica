program Ejer1P3;

type
    str20 = string[20];
    alumno = record
        codigo: integer;
        nombre: str20;
        promedio: real;
    end;

procedure leer(var alu: alumno);
    begin
        writeln('Ingrese el codigo del alumno');
        readln(alu.codigo);
        if (alu.codigo <> 0) then begin
            WriteLn('Ingrese el nombre del alumno'); readln(alu.nombre);
            WriteLn('Ingrese el promedio del alumno'); readln(alu.promedio);
        end;
    end;

procedure mejorPromedio(a: alumno; var maxProm: real; var maxNombre: string);
    begin
        if (a.promedio > maxProm) then begin
            maxProm := a.promedio;
            maxNombre := a.nombre;
        end;
    end;

var
    a : alumno;
    cant: integer;
    maxProm: real;
    maxNombre: str20;

begin
    cant := 0;
    maxProm := -1;

    leer(a);
    while(a.codigo <> 0) do begin
        mejorPromedio(a, maxProm, maxNombre);
        cant := cant + 1;

        leer(a);
    end;

    writeln('Alumnos leidos: ', cant);
    writeln('Alumno con mejor promedio: ', maxNombre, ' (', maxProm:0:2, ')');
end.