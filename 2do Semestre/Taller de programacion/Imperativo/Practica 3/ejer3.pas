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

    maximo = record
        legajo: integer;
        promedio: real;
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
    l := nil;
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
    else if (alum.legajo <= a^.dato.legajo) then
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


// Inciso B
procedure menoresQue(a: arbol; base: integer);
begin
    if (a <> nil) then begin
        if (a^.dato.legajo < base) then begin
            write('Legajo: ', a^.dato.legajo);
            writeln('   DNI: ', a^.dato.dni);
            menoresQue(a^.HI, base);
            menoresQue(a^.HD, base);
        end
        else
           menoresQue(a^.HI, base); 
    end;
end;

// Inciso C
function maxArbol(a: arbol): integer;
begin
    if (a^.HD = nil) then
        maxArbol := a^.dato.legajo
    else
        maxArbol := maxArbol(a^.HD);
end;

// Inciso D
function maxDni(a: arbol): integer;

    function max(a, b: integer): integer;
    begin
        if (a > b) then
            max := a
        else
            max := b;
    end;

begin
    if (a = nil) then
        maxDni := 0
    else
        maxDni := max(a^.dato.dni, max(maxDni(a^.HI), maxDni(a^.HD)));
end;

// Inciso E

function cantImpar(a: arbol): integer;

    function esImpar(a: integer): boolean;
    begin
        esImpar := a MOD 2 <> 0
    end;

begin
    if (a = nil) then
        cantImpar := 0
    else if (esImpar(a^.dato.legajo)) then
        cantImpar := 1 + cantImpar(a^.HI) + cantImpar(a^.HD)
    else
        cantImpar := cantImpar(a^.HI) + cantImpar(a^.HD); 
end;

// Inciso E
procedure maxProm(a: arbol; var max: maximo);
var
    act: maximo;

    function calcPromedio(l: lista): real;
    var
        prom: real;
        cant: integer;
    begin
        prom := 0;
        cant := 0;

        while (l <> nil) do begin
            cant := cant + 1;
            prom := prom + l^.dato.nota;
            l := l^.sig;
        end;

        calcPromedio := prom / cant;
    end;

    procedure crearMax(alu: alumno; var max: maximo);
    begin
        max.legajo := alu.legajo;
        max.promedio := calcPromedio(alu.materias);
    end;

    procedure actualizarMax(act: maximo; var max: maximo);
    begin
        if (act.promedio > max.promedio) then
            max := act;
    end;

begin
    if (a <> nil) then begin
        crearMax(a^.dato, act);
        actualizarMax(act, max);
        maxProm(a^.HI, max);
        maxProm(a^.HD, max);
    end;
end;

// Inciso F
procedure mayoresQue(a: arbol; base: integer);
begin
    if (a <> nil) then begin
        if (a^.dato.legajo >= base) then begin
            write('Legajo: ', a^.dato.legajo);
            writeln('   DNI: ', a^.dato.dni);
            mayoresQue(a^.HI, base);
            mayoresQue(a^.HD, base);
        end
        else
           mayoresQue(a^.HD, base); 
    end;
end;

var
    a: arbol;
    max: maximo;

begin
    generarArbol(a);
    menoresQue(a, 2);
    writeln('Legajo mas grande: ', maxArbol(a));
    writeln('DNI mas grande: ', maxDni(a));
    writeln('Cantidad de legajos impares: ', cantImpar(a));

    max.promedio := -1;
    maxProm(a, max);
    writeln('Alumno con mejor promedio. Legajo: ', max.legajo, '   promedio: ', max.promedio:1:2);
    mayoresQue(a, 2);
end.