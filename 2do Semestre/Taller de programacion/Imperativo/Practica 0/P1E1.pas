program P1E1;
const
	FIN = 11111;
	MATERIAS = 36;

type
	vectorMaterias = array[1..MATERIAS] of real;
	alumno = record
		apellido: string;
		num, ano, cantM: integer;
		notas: vectorMaterias;
	end;
	
	alumnoProm = record
		num: integer;
		promedio: real;
	end;
	
	listaProm = ^nodoProm;
	nodoProm = record
		dato: alumnoProm;
		sig: listaProm;
	end;
	
	listaAlumnos = ^nodoAlumno;
	nodoAlumno = record
		dato: alumno;
		sig: listaAlumnos;
	end;

procedure leerVector(var v: vectorMaterias; dimL: integer);
var
	i: integer;
begin
	for i := 1 to dimL do
		readln(v[i]);
end;	
	
procedure leerAlumno(var a: alumno);
begin
	writeln('Apellido: ');
	readln(a.apellido);
	writeln('Numero: ');
	readln(a.num);
	writeln('Año de ingreso: ');
	readln(a.ano);
	writeln('Cantidad de materias aprobadas: ');
	readln(a.cantM);
	writeln('Nota de las materias');
	leerVector(a.notas, a.cantM);
end;

procedure agregarAdelanteAlum(a: alumno; var l: listaAlumnos);
var
	nuevo: listaAlumnos;
begin
	new(nuevo);
	nuevo^.dato := a;
	nuevo^.sig := l;
	l := nuevo;
end;

procedure agregarAdelanteProm(a: alumnoProm; var l: listaProm);
var
	nuevo: listaProm;
begin
	new(nuevo);
	nuevo^.dato := a;
	nuevo^.sig := l;
	l := nuevo;
end;

procedure cargarAlumnos(var l: listaAlumnos);
var
	a: alumno;
begin
	repeat
		leerAlumno(a);
		agregarAdelanteAlum(a, l);
	until(a.num = FIN);
end;

function promedio(v: vectorMaterias; dimL: integer): real;
var
	i: integer;
	ret: real;
begin
	ret := 0;
	for i := 1 to dimL do
		ret := ret + v[i];
	
	promedio := ret / dimL;
end;

procedure promedioAlumnos(l: listaAlumnos; var ret: listaProm);
var
	aluProm: alumnoProm;
begin
	while(l <> nil) do begin
		aluProm.num := l^.dato.num;
		aluProm.promedio := promedio(l^.dato.notas, l^.dato.cantM);
		agregarAdelanteProm(aluProm, ret);
		
		l := l^.sig;
	end;
end;

var
	alumnos: listaAlumnos;
	promedios: listaProm;
begin
	cargarAlumnos(alumnos);
	promedioAlumnos(alumnos, promedios);
end.
