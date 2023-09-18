program Ejer2;
const
	DimF = 2018;

type
	anios = 2010..DimF;
	
	auto_sm = record
		patente: string[7];
		anio: anios;
		modelo: string[25];
	end;
	
	auto = record
		marca: string[25];
		info: auto_sm;
	end;

	lista_sm = ^nodo_sm;
	nodo_sm = record
		dato: auto_sm;
		sig: lista_sm;
	end;

	listaA = ^nodoA;
	nodoA = record
		dato: auto;
		sig: listaA;
	end;

	marca = record
		nombre: string[25];
		autos: lista_sm;
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

	vector = array[anios] of listaA;

procedure leerAuto(var a: auto);
var
	i: integer;
begin
	write('Ingrese la patente: ');
	readln(a.info.patente);
	if (a.info.patente <> 'XX000XX') then begin
		write ('Ingrese la marca del auto: ');
		readln(a.marca);

		// Genero un nombre de modelo al azar
		SetLength(a.info.modelo, 6);
		for i := 1 to 6 do
			a.info.modelo[i] := chr(Random(123-97) + 97);
		writeln('Modelo: ', a.info.modelo);

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

procedure agregarAdelante(var l: lista_sm; a: auto_sm);
var
	aux: lista_sm;
begin
	new(aux);
	aux^.dato := a;
	aux^.sig := l;
	l := aux;
end;

procedure agregarArbolMarca(var a: arbolM; au: auto);
begin
	if (a = nil) then begin
		new(a);
		a^.dato.nombre := au.marca;
		a^.dato.autos := nil;
		agregarAdelante(a^.dato.autos, au.info);
		a^.HI := nil;
		a^.HD := nil;
	end
	else
		if (au.marca = a^.dato.nombre) then
			agregarAdelante(a^.dato.autos, au.info)
		else if (au.marca < a^.dato.nombre) then
			agregarArbolMarca(a^.HI, au)
		else
			agregarArbolMarca(a^.HD, au);
end;

procedure cargarArboles(var aPatentes: arbolP; var aMarcas: arbolM);
var
	a: auto;
begin
	aPatentes := nil;
	aMarcas := nil;
	leerAuto(a);
	while (a.info.patente <> 'XX000XX') do begin
		agregarArbolPatente(aPatentes, a);
		agregarArbolMarca(aMarcas, a);
		leerAuto(a);
	end;
end;

// Le pasas dos marcas, si son iguales devuelve 1, de lo contrario devuelve 0
function mismaMarca(nombre, actual: string): integer;
begin
	if (nombre = actual) then
		mismaMarca := 1
	else
		mismaMarca := 0;
end;

// B) Contar Marca Arbol Patentes
function contarMarcasAP(aPatentes: arbolP; nombre: string): integer;
begin
	if (aPatentes <> nil) then begin
		contarMarcasAP := mismaMarca(aPatentes^.dato.marca, nombre) + contarMarcasAP(aPatentes^.HI, nombre) + contarMarcasAP(aPatentes^.HD, nombre);
	end
	else
		contarMarcasAP := 0;
end;

function encontrarNodo(a: arbolM; nombre: string): arbolM;
begin
	if (a = nil) or (a^.dato.nombre = nombre) then
		encontrarNodo := a
	else if (nombre < a^.dato.nombre) then
		encontrarNodo := encontrarNodo(a^.HI, nombre)
	else
		encontrarNodo := encontrarNodo(a^.HD, nombre);
end;

// Cuenta la cantidad de nodos de una lista. Recursivo
function contarNodosLista(l: lista_sm): integer;
begin
	if (l <> nil) then
		contarNodosLista := 1 + contarNodosLista(l^.sig)
	else
		contarNodosLista := 0;
end;

// C) Contar Marca Arbol Marcas
function contarMarcasAM(aMarcas: arbolM; nombre: string): integer;
var
	nodo: arbolM;
begin
	nodo := encontrarNodo(aMarcas, nombre);
	if (nodo = nil) then
		contarMarcasAM := 0
	else
		contarMarcasAM := contarNodosLista(nodo^.dato.autos);
end;

procedure inicializarListas(var v: vector);
var
	i: integer;
begin
	for i := 2010 to DimF do
		v[i] := nil;
end;

procedure agregarAdelanteAutos(var l: listaA; a: auto);
var
	aux: listaA;
begin
	new(aux);
	aux^.dato := a;
	aux^.sig := l;
	l := aux;
end;

// D)
procedure cargarVector(var v: vector; a: arbolP);
begin
	if (a <> nil) then begin
		agregarAdelanteAutos(v[a^.dato.info.anio], a^.dato);
		cargarVector(v, a^.HI);
		cargarVector(v, a^.HD);
	end;
end;

// E)
procedure obtenerModeloAP(a: arbolP; patente: string; var ret: string);
begin
	if (a <> nil) then begin
		if (patente = a^.dato.info.patente) then
			ret := a^.dato.info.modelo
		else if (patente < a^.dato.info.patente) then
			obtenerModeloAP(a^.HI, patente, ret)
		else
			obtenerModeloAP(a^.HD, patente, ret);
	end;
end;

procedure buscarEnLista(l: lista_sm; patente: string; var ret: string);
begin
	while (l <> nil) do begin
		if (patente = l^.dato.patente) then begin
			ret := l^.dato.modelo;
			l := nil;
		end
		else
			l := l^.sig;
	end;
end;

// F)
procedure obtenerModeloAM(a: arbolM; patente: string; var ret: string);
begin
	if (a <> nil) then begin
		buscarEnLista(a^.dato.autos, patente, ret);
		obtenerModeloAM(a^.HI, patente, ret);
		obtenerModeloAM(a^.HD, patente, ret);
	end;
end;

var
	aPatentes: arbolP;
	aMarcas: arbolM;
	v: vector;
	ret: string;
begin
	Randomize;

	cargarArboles(aPatentes, aMarcas);

	writeln('Cantidad de autos para Fiat (Patentes): ', contarMarcasAP(aPatentes, 'Fiat'));
	writeln('Cantidad de autos para Fiat (Marcas): ', contarMarcasAM(aMarcas, 'Fiat'));

	inicializarListas(v);
	cargarVector(v, aPatentes);

	obtenerModeloAP(aPatentes, 'AA000AA', ret);
	writeln('Modelo del auto con patente AA000AA (Patentes): ', ret);

	obtenerModeloAM(aMarcas, 'AA000AA', ret);
	writeln('Modelo del auto con patente AA000AA (Marcas): ', ret);
end.