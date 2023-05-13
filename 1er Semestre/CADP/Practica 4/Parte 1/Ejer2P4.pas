program Ejer2P4;

const
    cant_datos = 150;

type
    vdatos = array [1..cant_datos] of real;

procedure cargarVector(var v: vdatos; var dimL: integer);
var
    val: real;
begin
    dimL := 0;
    readln(val);
    while(val <> 0) and (dimL < cant_datos) do begin
        dimL := dimL + 1;
        v[dimL] := val;
        read(val);
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
