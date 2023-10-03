program parcial_f;

type
    sub_diagnostico = 1..15;
    sub_mes = 0..12;

    atencion = record
        dni: integer;
        mes: sub_mes;
        diagnostico: sub_diagnostico;
    end;

    atenciones = record
        dni, total: integer;
    end;

    arbol = ^nodo;
    nodo = record
        dato: atenciones;
        HI: arbol;
        HD: arbol;
    end;

    vector = array[sub_diagnostico] of integer;

procedure leerAtencion(var a: atencion);
begin
    a.mes := Random(13);
    writeln('Mes: ', a.mes);
    if (a.mes <> 0) then begin
        a.dni := Random(1000) + 1;
        writeln('DNI: ', a.dni);
        a.diagnostico := Random(15) + 1;
        writeln('Diagnostico: ', a.diagnostico);
        writeln('')
    end;
end;

procedure agregarAlArbol(var a: arbol; at: atencion);
begin
    if (a = nil) then begin
        new(a);
        a^.dato.dni := at.dni;
        a^.dato.total := 1;
        a^.HI := nil;
        a^.HD := nil;
    end
    else if (at.dni = a^.dato.dni) then
        a^.dato.total := a^.dato.total + 1
    else if (at.dni < a^.dato.dni) then
        agregarAlArbol(a^.HI, at)
    else
        agregarAlArbol(a^.HD, at);
end;

procedure cargarDatos(var v: vector; var a: arbol);
var
    at: atencion;
begin
    leerAtencion(at);
    while (at.mes <> 0) do begin
        agregarAlArbol(a, at);
        v[at.diagnostico] := v[at.diagnostico] + 1;
        leerAtencion(at);
    end;
end;

function cantPacientes(a: arbol; minDNI, maxDNI, x: integer): integer;
var
    i: integer;
begin
    if (a = nil) then
        cantPacientes := 0
    else if (a^.dato.dni < minDNI) then
        cantPacientes := cantPacientes(a^.HD, minDNI, maxDNI, x)
    else if (a^.dato.dni > maxDNI) then
        cantPacientes := cantPacientes(a^.HI, minDNI, maxDNI, x)
    else begin
        i := 0;
        if (a^.dato.total > x) then
            i := 1;
        
        cantPacientes := i + cantPacientes(a^.HI, minDNI, maxDNI, x) + cantPacientes(a^.HD, minDNI, maxDNI, x);
    end;
end;

function ceroAtenciones(v: vector; DimF: integer): integer;
var
    i: integer;
begin
    if (dimF = 0) then
        ceroAtenciones := 0
    else begin
        i := 0;
        if (v[DimF] = 0) then
            i := 1;
        
        ceroAtenciones := i + ceroAtenciones(v, DimF - 1);
    end;
end;

procedure imprimirVector(v: vector);
var
    i: integer;
begin
    for i := 1 to 15 do 
        writeln(i, ': ', v[i]);
end;

var
    v: vector;
    a: arbol;

begin
    Randomize;

    cargarDatos(v, a);
    writeln('-------- Vector --------');
    imprimirVector(v);

    writeln('Cantidad de pacientes con mas de 1 atencion y dni entre 500 y 700: ', cantPacientes(a, 500, 700, 1));
    writeln('Cantidad de diagnosticos con 0 atenciones: ', ceroAtenciones(v, 15));
end.