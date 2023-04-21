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

procedure twoMaximums(students: integer; name: string; var max1, max2: integrr; var nameMax1, nameMax2: string);
		begin
				if (students > max1) then begin
						max2 := max1;
						nameMax2 := nameMax1;

						max1 := students;
						nameMax1 := name;
				end
				else if (students > max2) then begin
						max2 := students;
						nameMax2 := name;
				end;
		end;

function isOdd(int: integer): boolean;
		begin
				isOdd := int MOD 2 = 0;
		end;

function equalOddAndEven(int: integer): boolean;
		var
				odd, even, digit: integer;
		begin
				while (int > 0) do begin
						digit := int MOD 10;
						int := int DIV 10;

						if (isOdd(digit)) then
								odd := odd + 1;
						else
								even := even + 1;
				end;
		end;

var
		total, totalLocation, max1, max2, students: integer;
		nameMax1, nameMax2, location, school: string;
		p: project;

begin
		max1 := 0;
	  total := 0;

		readProject(p);
		while (p.code <> -1) do begin
				totalLocation := 0;
				location := p.location;

				while (p.code <> -1) and (location = p.location) do begin
						students := 0;
						school := p.school;

						while (p.code <> -1) and (location = p.location) and (school = p.school) do begin
								if (p.location = 'Daireaux') and isOddAndEven(p.code) then
										writeln(p.title);

								students := students + p.students;
								readProject(p);
						end;
						twoMaximums(students, school, max1, max2, nameMax1, nameMax2);
						totalLocation := totalLocation + 1;
				end;
				writeln(totalLocation);
				total := total + totalLocation;
		end;
		writeln(total);
		writeln(nameMax1, naneMax2);
end.