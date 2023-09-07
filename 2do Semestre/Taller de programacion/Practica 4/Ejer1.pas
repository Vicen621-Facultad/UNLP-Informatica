program Ejer1;

type
	venta = record
		codV, codP, cant: integer;
		precio: real;
	end;
	
	producto = record
		cod, total: integer;
		monto: real;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: producto;
		HI: arbol;
		HD: arbol;
	end;
	
procedure leerVenta(var v: venta);
begin
	write('Ingrese el codigo de venta: ');
	readln(v.codV);
	if (v.codV <> -1) then begin
		v.codP := Random(10) + 1;
		writeln('Codigo de producto: ', v.codP);
		v.cant := Random(10) + 1;
		writeln('Cantidad: ', v.cant);
		v.precio := Random * 100;
		writeln('Precio de la unidad: ', v.precio:8:2);
		writeln('');
	end;
end;

procedure crearProd(var p: producto; v: venta);
begin
	p.cod := v.codP;
	p.total := v.cant;
	p.monto := v.precio * v.cant;
end;

procedure actualizarProd(var p: producto; v: venta);
begin
	p.total := p.total + v.cant;
	p.monto := p.monto + (v.precio * v.cant);
end;

procedure agregarArbol(var a: arbol; p: producto);
begin
	if (a = nil) then begin
		new(a);
		a^.dato := p;
		a^.HI := nil;
		a^.HD := nil;
	end
	else if (p.cod <= a^.dato.cod) then
		agregarArbol(a^.HI, p)
	else
		agregarArbol(a^.HD, p);
end;

// Devuele el nodo que contiene el codP, de lo contrario devuelve nil
function encontrarNodo(a: arbol; codP: integer): arbol;
begin
	if (a = nil) or (a^.dato.cod = codP) then
		encontrarNodo := a
	else if (codP < a^.dato.cod) then
		encontrarNodo := encontrarNodo(a^.HI, codP)
	else
		encontrarNodo := encontrarNodo(a^.HD, codP);
end;

procedure generarArbol(var a: arbol);
var
	node: arbol;
	v: venta;
	p: producto;
begin
	leerVenta(v);
	while (v.codV <> -1) do begin
		node := encontrarNodo(a, v.codP);
		if (node = nil) then begin 
			// Si el nodo no existe creo el producto y lo agrego al arbol
			crearProd(p, v);
			agregarArbol(a, p);
		end
		else 
			// Si el nodo existe, actualizo los valores
			actualizarProd(node^.dato, v);

		leerVenta(v);
	end;
end;

procedure imprimirArbol(a: arbol);
begin
	if (a <> nil) then begin
		imprimirArbol(a^.HI);
		writeln('cod: ', a^.dato.cod, 
				'  total: ', a^.dato.total, 
				'  monto: ', a^.dato.monto:4:2
		);
		imprimirArbol(a^.HD);
	end;
end;

procedure actualizarMax(p: producto; var max: producto);
begin
	if (p.total > max.total) then
		max := p;
end;

procedure maximoVentas(a: arbol; var max: producto);
begin
	if (a <> nil) then begin
		actualizarMax(a^.dato, max);
		maximoVentas(a^.HI, max);
		maximoVentas(a^.HD, max);
	end;
end;

function contarMenores(a: arbol; cod: integer): integer;
begin
	if (a = nil) then
		contarMenores := 0
	else if (a^.dato.cod <= cod) then
		contarMenores := 1 + contarMenores(a^.HI, cod) + contarMenores(a^.HD, cod)
	else
		contarMenores := contarMenores(a^.HD, cod);
end;

var
	a: arbol;
	max: producto;
begin
	Randomize;
	generarArbol(a);
	imprimirArbol(a);
	
	max.total := -1;
	
	writeln('');
	maximoVentas(a, max);
	writeln('Codigo de producto con mas ventas: ', max.cod);
	writeln('Cantidad de codigos menores que 8: ', contarMenores(a, 8));
end.
