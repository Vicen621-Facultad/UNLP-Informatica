program Ejer3P3;

const
    kidsPerTeacher = 23.435;

type
    school = record
        cue, teachers, students: integer;
        name, location: string;
    end;

procedure readSchool(var sch: school);
    begin
        WriteLn('Ingrese CUE'); ReadLn(sch.cue);
        WriteLn('Ingrese la cantidad de alumnos'); ReadLn(sch.students);
        WriteLn('Ingrese la cantidad de profesores'); ReadLn(sch.teachers);
        WriteLn('Ingrese el nombre'); ReadLn(sch.name);
        WriteLn('Ingrese la localidad'); ReadLn(sch.location);
    end;

function studentsPerTeacher(students, teachers: integer;): real;
    begin
        studentsTeachers := students / teachers;
    end;

procedure bestRelations(avgStudents: real; schoolName: string; var cueMin1, cueMin2: integer; var nameMin1, nameMin2: string);
    begin
        if (avgStudents < cueMin1) then begin
            cueMin2 := cueMin1;
            nameMin2 := nameMin1;

            cueMin1 := avgStudents;
            nameMin1 := schoolName;
        end
        else if (avgStudents < cueMin2) then begin
            cueMin2 := avgStudents;
            nameMin2 := schoolName;
        end;
    end;

var
    cant, cueMin1, cueMin2, i: integer;
    nameMin1, nameMin2: string;
    sch: school;
    avgStudents: real;

begin
    cueMin1 := 999;
    cant := 0;

    {Se inicializa para que cuando a nameMin2 se le asigne nameMin1 no se le asigne basura}
    nameMin1 := '';

    for i := 1 to 2400 do begin
        readSchool(sch);
        avgStudents := studentsPerTeacher(sch.students, sch.teachers);

        
        if (avgStudents > kidsPerTeacher) then
            cant := cant + 1;
        
        bestRelations(avgStudents, sch.name, cueMin1, cueMin2, nameMin1, nameMin2);
    end;

    WriteLn('Cantidad de escuelas con indice mayor que UNESCO ', cant);
    WriteLn('Escuelas con mejor relacion alumnos/profesores ', nameMin1, ', ', nameMin2);
end.