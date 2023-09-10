
Program Ejer1;

Type 
    socio =   Record
        edad, num:   integer;
        nombre:   string;
    End;

    arbol =   ^nodo;
    nodo =   Record
        dato:   socio;
        HI:   arbol;
        HD:   arbol;
    End;

Procedure agregarArbol(Var a: arbol; s: socio);
Begin
    If (a = Nil) Then
        Begin
            new(a);
            a^.dato := s;
            a^.HI := Nil;
            a^.HD := Nil;
        End
    Else If (s.num <= a^.dato.num) Then
             agregarArbol(a^.HI,s)
    Else
        agregarArbol(a^.HD,s);
End;
Procedure leerSocio(Var s: socio);
Begin
    write('Ingrese numero de socio: ');
    readln(s.num);
    If (s.num <> 0) Then
        Begin
            s.edad := Random(100);
            writeln('Edad asignadas: ', s.edad);
            write('Ingrese nombre: ');
            readln(s.nombre);
        End;
End;
Procedure generarArbol(Var a: arbol);

Var 
    s:   socio;
Begin
    leerSocio(s);
    While (s.num <> 0) Do
        Begin
            agregarArbol(a,s);
            leerSocio(s);
        End;
End;

Function maximo(a: arbol):   integer;
Begin
    If (a^.HD = Nil)Then
        maximo := a^.dato.num
    Else
        maximo := maximo(a^.HD);
End;

Procedure imprimirSocio(s: socio);
Begin
    writeln('numero de socio: ', s.num);
    writeln('edad: ', s.edad);
    writeln('nombre: ', s.nombre);
End;

Procedure minimo(a: arbol);
Begin
    If (a^.HI = Nil)Then
        imprimirSocio(a^.dato)
    Else
        minimo(a^.HI);
End;

Function max(a,b: integer):   integer;
Begin
    If (a > b) Then
        max := a
    Else
        max := b;
End;

Function tresMax(a,b,c: integer):   integer;
Begin
    tresMax := max(a, max(b,c));
End;

Function mayorEdad(a: arbol):   integer;
Begin
    If (a <> Nil) Then
        mayorEdad := tresMax(
                     a^.dato.edad,
                     mayorEdad(a^.HI),
                     mayorEdad(a^.HD)
                     )
    Else
        mayorEdad := -1;
End;

Procedure aumentarEdad(a: arbol);
Begin
    If (a <> Nil) Then
        Begin
            aumentarEdad(a^.HI);
            a^.dato.edad := a^.dato.edad + 1;
            aumentarEdad(a^.HD);
        End;
End;

Function existe(a: arbol; val: integer):   boolean;
Begin
    If (a <> Nil) Then
        existe := (a^.dato.num = val) Or existe(a^.HI, val) Or existe(a^.HD, val)
    Else
        existe := false;
End;

Function existeNombre(a: arbol; val: String):   boolean;
Begin
    If (a <> Nil) Then
        Begin
            existeNombre := (a^.dato.nombre = val) Or existeNombre(a^.HI, val) Or existeNombre(a^.HD, val);
        End
    Else
        existeNombre := false;
End;

Function contarArbol(a: arbol):   integer;
Begin
    If (a <> Nil) Then
        Begin
            contarArbol := 1 + contarArbol(a^.HD) + contarArbol(a^.HI);
        End
    Else
        contarArbol := 0;
End;

Function calcularPromedio(val: integer; totalNum: integer):   real;
Begin
    calcularPromedio := val / totalNum;
End;

Function sumarEdades(a: arbol):   integer;
Begin
    If (a <> Nil) Then
        Begin
            sumarEdades := a^.dato.edad + sumarEdades(a^.HD) + sumarEdades(a^.HI);
        End
    Else
        sumarEdades := 0;
End;

Function calcularPromedioEdades(a: arbol):   real;
Begin
    calcularPromedioEdades := calcularPromedio(sumarEdades(a), contarArbol(a));
End;

Procedure imprimirCreciente(a: arbol);
Begin
    If (a <> Nil) Then
        Begin
            imprimirCreciente(a^.HI);
            writeln(a^.dato.num);
            imprimirCreciente(a^.HD);
        End;
End;

Procedure imprimirDecreciente(a: arbol);
Begin
    If (a <> Nil) Then
        Begin
            imprimirDecreciente(a^.HD);
            writeln(a^.dato.num);
            imprimirDecreciente(a^.HI);
        End;
End;


Var 
    a:   arbol;
    nombre:   string;
    num:   integer;
Begin
    Randomize;
    generarArbol(a);
    writeln('Maximo: ', maximo(a));

    writeln('---------- Minimo ---------- ');
    minimo(a);

    writeln('Mayor edad: ', mayorEdad(a));
    aumentarEdad(a);

    write('Numero a buscar: ');
    readln(num);
    writeln('Existe ', num, ': ', existe(a, num));

    write('Nombre a buscar: ');
    readln(nombre);
    writeln('Existe ', nombre, ': ', existeNombre(a, nombre));

    writeln('Numero de nodos: ', contarArbol(a));
    writeln('Promedio de edades: ', calcularPromedioEdades(a):   2:   2);

    writeln('------- Arbol Creciente -------');
    imprimirCreciente(a);
    writeln('------ Arbol Decreciente ------');
    imprimirDecreciente(a);
End.
