program ejer3;

type
    materia = record
        cod: integer;
        nota: real;
    end;

    lista = ^nodoL;
    nodoL = record
        dato: materia;
        sig: lista;
    end;

    alumno = record
        legajo, dni, ingreso: integer;
        materias: lista;
    end;

    arbol = ^nodoA;
    nodoA = record
        dato: alumno;
        HI: arbol;
        HD: arbol;
    end;

procedure leerMateria(var m: materia);
begin
    write('Ingrese codigo de materia: ');
    readln(m.cod);
    if (m.cod <> -1) then begin
        m.nota := Random * 10;
        writeln('Nota: ', m.nota:2:2);
    end;
end;

procedure agregarAdelante(var l: lista; m: materia);
var
    nue: lista;
begin
    new(nue);
    nue^.dato := m;
    nue^.sig := l;
    l := nue;
end;

procedure cargarLista(var l: lista);
var
    m: materia;
begin
    leerMateria(m);
    while (m.cod <> -1) do begin
        agregarAdelante(l, m);
        leerMateria(m);
    end;
end;

procedure leerAlumno(var a: alumno);
begin
    write('Ingrese numero de legajo: ');
    readln(a.legajo);
    if (a.legajo <> 0) then begin
        a.dni := Random(10000) + 1;
        writeln('DNI: ', a.dni);
        a.ingreso := 2023;
        cargarLista(a.materias);
        writeln('');
    end;
end;

procedure agregarArbol(var a: arbol; alum: alumno);
begin
    if (a = nil) then begin
        new(a);
        a^.dato := alum;
        a^.HI := nil;
        a^.HD := nil;
    end
    else if (a^.dato.legajo <= alum.legajo) then
        agregarArbol(a^.HI, alum)
    else
        agregarArbol(a^.HD, alum);
end;

procedure generarArbol(var a: arbol);
var
    alum: alumno;
begin
    leerAlumno(alum);
    while (alum.legajo <> 0) do begin
        agregarArbol(a, alum);
        leerAlumno(alum);
    end;
end;

// Inciso C
function maxArbol(a: arbol): integer;
begin
    if (a^.HD = nil) then
        maximo := a^.dato.legajo
    else
        maximo := maximo(a^.HD);
end;

var
    a: arbol;
begin
    generarArbol(a);
    writeln('Legajo mas grande: ', maxArbol(a));
end.