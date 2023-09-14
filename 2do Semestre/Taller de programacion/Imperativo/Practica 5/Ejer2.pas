program Ejer2;

type
	anios = 2010..2018;
	
	auto_sm = record
		patente: string[7];
		anio: anios;
		modelo: string[25];
	end;
	
	auto = record
		marca: string[25];
		info: auto_sm;
	end;

	lista = ^nodoL;
	nodoL = record
		dato: auto_sm;
		sig: lista;
	end;
	
	marca = record
		nombre: string[25];
		autos: lista;
	end;
	
	arbolP = ^nodoP;
	nodoP = record
		dato: auto;
		HI: arbolP;
		HD: arbolP;
	end;
	
	arbolM = ^nodoM;
	nodoM = record
		dato: marca;
		HI: arbolM;
		HD: arbolM;
	end;

procedure leerAuto(var a: auto);
begin
	write('Ingrese la patente: ');
	readln(a.info.patente);
	if (a.info.patente <> 'XX000XX') then begin
		write ('Ingrese la marca del auto: ');
		readln(a.marca);
		a.info.modelo := 'X';
		// Genero un numero al azar entre el 2010 y el 2018
		a.info.anio := Random(9) + 2010;
		writeln('Anio de fabricacion: ', a.info.anio);
	end;
end;
	
procedure agregarArbolPatente(var a: arbolP; au: auto);
begin
	if (a = nil) then begin
		new(a);
		a^.dato := au;
		a^.HI := nil;
		a^.HD := nil;
	end
	else
		if (au.info.patente <= a^.dato.info.patente) then
			agregarArbolPatente(a^.HI, au)
		else
			agregarArbolPatente(a^.HD, au);
end;

procedure agregarArbolMarca(var a: arbolM; m: marca);
begin
	if (a = nil) then begin
		new(a);
		a^.dato := m;
		a^.dato.autos := nil
		// agrego auto  la lista
		a^.HI := nil;
		a^.HD := nil;
	end
	else
		if es igual
			agregar a la lista
		else if (m.nombre < a^.dato.nombre) then
			agregarArbolMarca(a^.HI, m)
		else
			agregarArbolMarca(a^.HD, m);
end;

function obtenerMarca(a: arbolM; m: string): arbolM;
begin
	if (a = nil) or (a^.dato.nombre = m) then
		obtenerMarca := a
	else if (m < a^.dato.nombre) then
		obtenerMarca(a^.HI, m)
	else
		obtenerMarca(a^.HD, m);
end;

procedure agregarAdelante(var l: lista; a: auto_sm);
var
	aux: lista;
begin
	new(aux);
	aux^.dato := a;
	aux^.sig := l;
	l := aux;
end;

procedure cargarMarca(var m: marca; a: auto);
begin
	m.nombre := a.marca;
	m.autos := nil;
	agregarAdelante(m.autos, a.info);
end;

procedure cargarArbolMarca(var aMarcas: arbolM; a: auto);
var
	aux: arbolM;
	m: marca;
begin
	aux := obtenerMarca(aMarcas, a.marca);
	if (aux = nil) then begin
		cargarMarca(m, a);
		agregarArbolMarca(aMarcas, m);
	end
	else
		agregarAdelante(aux^.dato.autos, a.info);
end;

procedure cargarArboles(var aPatentes: arbolP; var aMarcas: arbolM);
var
	a: auto;
begin
	leerAuto(a);
	while (a.info.patente <> 'XX000XX') do begin
		agregarArbolPatente(aPatentes, a);
		writeln('DEBUG: Agregado a patentes');
		cargarArbolMarca(aMarcas, a);
		writeln('DEBUG: Agregado a marcas');
		leerAuto(a);
	end;
end;

procedure imprimirAuto(a: auto);
begin
	writeln('Marca: ', a.marca, 
			'   Patente: ', a.info.patente, 
			'   Modelo: ', a.info.modelo, 
			'   Anio: ', a.info.anio);
end;

procedure imprimirArbolPatentes(a: arbolP);
begin
	if (a <> nil) then begin
		imprimirArbolPatentes(a^.HI);
		imprimirAuto(a^.dato);
		imprimirArbolPatentes(a^.HD);
	end;
end;

procedure imprimirAuto_sm(a: auto_sm);
begin
	writeln('Patente: ', a.patente, 
			'   Modelo: ', a.modelo, 
			'   Anio: ', a.anio);
end;

procedure imprimirLista(l: lista);
begin
	while (l <> nil) do begin
		imprimirAuto_sm(l^.dato);
		writeln('');
		l := l^.sig;
	end;
end;

procedure imprimirMarca(m: marca);
begin
	writeln('Marca: ', m.nombre, '   Autos:');
	imprimirLista(m.autos);
end;

procedure imprimirArbolMarcas(a: arbolM);
begin
	if (a <> nil) then begin
		imprimirArbolMarcas(a^.HI);
		imprimirMarca(a^.dato);
		imprimirArbolMarcas(a^.HD);
	end;
end;

var
	aPatentes: arbolP;
	aMarcas: arbolM;
begin
	cargarArboles(aPatentes, aMarcas);
	writeln('-------- Arbol de Patentes --------');
	imprimirArbolPatentes(aPatentes);
	writeln('-------- Arbol de Marcas --------');
	imprimirArbolMarcas(aMarcas);
end.
