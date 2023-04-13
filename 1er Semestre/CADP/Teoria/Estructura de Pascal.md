# Estructura de Pascal

## Estructura general

```pascal
program {name of the program}
uses {comma delimited names of libraries you use}
const {global constant declaration block}
type {types varianle declaration block}
var {global variable declaration block}

function {function declarations, if any}
{ local variables }
	begin
		...
	end;

procedure { procedure declarations, if any}
{ local variables }
	begin
		...
	end;

var {local variables}
begin { main program block starts}
...
end. { the end of main program block }
```

## Estructura de las funciones

```pascal
{function funName(var(s): type; var(s): type): returnType;}
function func(var1: integer; var2, var3: char): boolean;
	var {local var}
		var4: real;
	begin
		...
		{all functions have to end with the name of the function with  a declaration to de return type}
		func := true; 
	end;
```

## Estructura de los procedimientos

```pascal
{procedure procName(var(s): type; var(s): type);}
procedure proc(var1: integer; var2, var3: char);
	var {local var}
		var3: real;
	begin
		...
	end;
```

