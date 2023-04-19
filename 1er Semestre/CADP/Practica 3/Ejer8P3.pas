program Ejer8P3;

type
    teacher = record
        dni: integer;
        name, lastname, email: string;
    end;

    project = record
        code, students: integer;
        coordinator: teacher;
        title, school, location: string;
    end;

procedure readTeacher(var t: teacher);
    begin
        readln(t.dni);
        readln(t.name);
        readln(t.lastname);
        readln(t.email);
    end;

procedure readProject(var p: project);
    begin
        readln(p.code);
        readln(p.students);
        readTeacher(p.coordinator);
        readln(p.title);
        readln(p.school);
        readln(p.location);
    end;

begin
  
end.