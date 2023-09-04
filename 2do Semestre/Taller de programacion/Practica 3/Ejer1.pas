program Ejer1;
type
	socio = record
		edad, num: integer;
		nombre: string;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: socio;
		HI: arbol;
		HD: arbol;
	end;
	
procedure agregarArbol(var a: arbol; s: socio);
begin
	if (a = nil) then begin
		new(a);
		a^.dato:=s;
		a^.HI:=nil;
		a^.HD:=nil;
	end
	else if (s.num <= a^.dato.num) then 
		agregarArbol(a^.HI,s)
	else
		agregarArbol(a^.HD,s);
end;
procedure leerSocio(var s: socio);
begin
	write('Ingrese numero de socio: ');
	readln(s.num);
	if (s.num <> 0) then begin
		s.edad := Random(100);
		writeln('Edad asignadas: ', s.edad);
		write('Ingrese nombre: ');
		readln(s.nombre);
	end;
end;
procedure generarArbol(var a: arbol);
var
	s:socio;
begin
	leerSocio(s);
	while (s.num <> 0) do begin 
		agregarArbol(a,s);
		leerSocio(s);
	end;
end;

function maximo(a: arbol):integer;
begin
	if(a^.HD = nil)then
		maximo := a^.dato.num
	else
		maximo := maximo(a^.HD);
end;

procedure imprimirSocio(s: socio);
begin
	writeln('numero de socio: ', s.num);
	writeln('edad: ', s.edad);
	writeln('nombre: ', s.nombre);
end;

procedure minimo(a: arbol);
begin
	if (a^.HI = nil)then
		imprimirSocio(a^.dato)
	else
		minimo(a^.HI);
end;

function max(a,b: integer): integer;
begin
	if (a > b) then
		max := a
	else
		max := b;
end;

function tresMax(a,b,c: integer): integer;
begin
	tresMax := max(a, max(b,c));
end;

function mayorEdad(a: arbol): integer;
begin
	if (a <> nil) then
		mayorEdad := tresMax(
			a^.dato.edad, 
			mayorEdad(a^.HI), 
			mayorEdad(a^.HD)
		)
	else
		mayorEdad := -1;
end;

procedure aumentarEdad(a: arbol);
begin
	if (a <> nil) then begin
		aumentarEdad(a^.HI);
		a^.dato.edad := a^.dato.edad + 1;
		aumentarEdad(a^.HD);
	end;
end;

function existe(a: arbol; val: integer): boolean;
begin
	if (a <> nil) then begin
		existe := (a^.dato.num = val) or existe(a^.HI, val) or existe(a^.HD, val);
	end
	else
		existe := false;
end;

function existeNombre(a: arbol; val: string): boolean;
begin
	if (a <> nil) then begin
		existeNombre := (a^.dato.nombre = val) or existeNombre(a^.HI, val) or existeNombre(a^.HD, val);
	end
	else
		existeNombre := false;
end;

function contarArbol(a: arbol): integer;
begin
	if (a <> nil) then begin
		contarArbol := 1 + contarArbol(a^.HD) + contarArbol(a^.HI);
	end
	else
		contarArbol := 0;
end;

function calcularPromedio(val: integer; totalNum: integer): real;
begin
	calcularPromedio := val / totalNum;
end;

function sumarEdades(a: arbol): integer;
begin
	if (a <> nil) then begin
		sumarEdades := a^.dato.edad + sumarEdades(a^.HD) + sumarEdades(a^.HI);
	end
	else
		sumarEdades := 0;
end;

function calcularPromedioEdades(a: arbol): real;
begin
	calcularPromedioEdades := calcularPromedio(sumarEdades(a), contarArbol(a));
end;

procedure imprimirCreciente(a: arbol);
begin
	if (a <> nil) then begin
		imprimirCreciente(a^.HI);
		writeln(a^.dato.num);
		imprimirCreciente(a^.HD);
	end;
end;

procedure imprimirDecreciente(a: arbol);
begin
	if (a <> nil) then begin
		imprimirDecreciente(a^.HD);
		writeln(a^.dato.num);
		imprimirDecreciente(a^.HI);
	end;
end;


var
	a: arbol;
	nombre: string;
	num: integer;
begin
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
	writeln('Promedio de edades: ', calcularPromedioEdades(a):2:2);
	
	writeln('------- Arbol Creciente -------');
	imprimirCreciente(a);
	writeln('------ Arbol Decreciente ------');
	imprimirDecreciente(a);
end.
