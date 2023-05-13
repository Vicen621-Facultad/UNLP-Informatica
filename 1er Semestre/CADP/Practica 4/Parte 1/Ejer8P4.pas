program Ejer8P4;
const
    dimF = 400;
type
    student = record
        dni, id, year: integer;
        name, lastname: string;
    end;

    vector = array[1..dimF] of student;

procedure readStudent(var st: student);
begin
    readln(st.dni);
    readln(st.id);
    readln(st.year);
    readln(st.name);
    readln(st.lastname);
end;

procedure readVector(var v: vector; var dimL: integer);
var
    val: student;
begin
    dimL := 0;
    readStudent(val);
    while (val.dni <> -1) and (dimL < dimF) do begin
        dimL := dimL + 1;
        v[dimL] := val;
        readStudent(val);
    end;
end;

procedure twoMinimums(v: vector; dimL: integer; var stMin1, stMin2: student);
var
    min1, min2, i: integer;
begin
    min1 := 2020;

    for i := 1 to dimL do begin
        if (v[i].year < min1) then begin
            min2 := min1;
            stMin2 := stMin1;

            min1 := v[i].year;
            stMin1 := v[i];
        end
        else if (v[i].year < min2) then begin
            min2 := v[i].year;
            stMin2 := v[i];
        end;
    end;
end;

function allDigitsEven(number: integer): boolean;
var
    digit: integer;
    bool: boolean;
begin
    bool := true;
    while (number <> 0) and (bool) do begin
        digit := number MOD 10;
        number := number DIV 10;

        bool := (digit MOD 2) = 0;
    end;

    allDigitsEven := bool;
end;

function percentageEvenDNI(v: vector; dimL: integer): real;
var
    i, cant: integer;
begin
    cant := 0;
    for i := 1 to dimL do begin
        if (allDigitsEven(v[i].dni)) then
            cant := cant + 1;
    end;
    percentageEvenDNI := cant * 100 / dimL;
end;

var
    v: vector;
    stMin1, stMin2: student;
    dimL: integer;

begin
    readVector(v, dimL);
    twoMinimums(v, dimL, stMin1, stMin2);

    writeln('Porcentaje de alumnos con DNI compuesto solo por digitos pares: %', percentageEvenDNI(v, dimL):2:2);
	writeln('Nombres de los 2 alumnos de mayor edad:');
	writeln(stMin1.name, ' ', stMin1.lastname);
	writeln(stMin2.name, ' ', stMin2.lastname);
end.