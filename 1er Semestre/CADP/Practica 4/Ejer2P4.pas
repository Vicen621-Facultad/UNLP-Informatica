program Ejer2P4;

const
    cant_datos = 150;

type
    vdatos = array [1..cant_datos] of real;

procedure cargarVector(var v: vdatos; var dimL: integer);
var
    i: integer;
    val: real;
begin
    for i:= 1 to cant_datos do begin
        readln(val);

        if (val <> 0) then
            v[i] := val
        else
            dimL := i - 1;
    end;
end;

procedure modificarVectorYSumar(var v: vdatos; dimL: integer; n: real; var suma: real);
var
    i: integer;
begin
    suma := 0;
    for i := 1 to dimL do begin
        suma := suma + v[i];
        v[i] := v[i] + n;
    end;
end;

var
    datos: vdatos;
    i, dim: integer;
    num, suma: real;

begin
    dim := 0;
    suma := 0;
    cargarVector(datos, dim);
    writeln('Ingrese un valor a sumar');
    readln(num);
    modificarVectorYSumar(datos, dim, num, suma);
    writeln('La suma de los vectores es: ', suma);
    writeln('Se procesarion: ', dim, ' numeros');
end.
