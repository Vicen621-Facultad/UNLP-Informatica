program Ejer4P4P2;
const
	dimF = 1000;
type
	student = record
		numStd, asist: integer;
		name, lastname: string[25];
	end;
	vector = array[1..dimF] of student;

procedure readStd(var std: student);
begin
	// ...
end;

procedure loadVector(var v: vector; var dimL: integer);
begin
	// ...
end;

function getStd(v: vector; dimL, x: integer): integer;
var
	i: integer;
	ok: boolean;
begin
	ok := false;
	i := 1;
	repeat
		if (v[i].numStd = x) then
			ok := true;
		i := i + 1;
	until (ok) or (i > dimL) or (v[i].numStd > x);
	getStd := i;
end;

procedure insert(var v: vector; var dimL: integer; pos: integer; std: student);
begin
	if (dimL + 1 <= dimF) and (pos >= 1) and (pos <= dimL) then begin
		dimL := dimL + 1;
		for i := dimL downto i do
			v[i] := v[i-1];
		v[pos] := alu;
	end;
end;

begin

end.