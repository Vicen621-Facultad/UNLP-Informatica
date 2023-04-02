program Ejer2P1Ad;

var
  condition: char;
  totalIng, totalRe, parcialRe, parcialIng, passAll, avg6, zInOneCount, notes10, notes0,
  max10, max102, max0, max02, legajo, legajoMax10, legajoMax102,
  legajoMax0, legajoMax02, aprobados, i: integer;
  note, notesAvg: real;
  zInOne: boolean;

begin
  max10 := -1; max102 := -1; max0 := -1; max02 := -1; totalIng := 0; totalRe := 0;
  zInOneCount := 0; passAll := 0; avg6 := 0; legajoMax10 := -1; legajoMax0 := -1;
  parcialRe := 0; parcialIng := 0;

  write('Ingrese un legajo: '); read(legajo);

  while(legajo <> 0) do begin
    write('Ingrese la condicion del alumno: '); read(condition);
    writeln('Ingrese las 5 notas del alumno');

    aprobados := 0; notes10 := 0; notes0 := 0; zInOne := false;
    for i := 1 to 5 do begin
      readln(note);

      case note of
        0: begin
          zInOne := true;
          notes0 := notes0 + 1;
        end;
        4..9:
            aprobados := aprobados + 1;
        10: begin
          notes10 := notes10 + 1;
          aprobados := aprobados + 1;
        end;
      end;

      if (note <> -1) then
        notesAvg := notesAvg + note;
    end;

    if (zInOne) then
      zInOneCount := zInOneCount + 1;

    if (condition = 'R') then
      totalRe := totalRe + 1;
    if (condition = 'I') then
      totalIng := totalIng + 1;

    if (aprobados >= (5*0.75)) then begin
      if (condition = 'R') then
        parcialRe := parcialRe + 1;
      if (condition = 'I') then
        parcialIng := parcialIng + 1;
    end;
      
    if (aprobados = 5) then
      passAll := passAll + 1;
    
    if (notesAvg / 5 > 6.5) then
      avg6 := avg6 + 1;
    
    if (notes0 > max0) then begin
      max02 := max0;
      legajoMax02 := legajoMax0;

      max0 := notes0;
      legajoMax0 := legajo;
    end
    else if (notes0 > max02) then begin
      max02 := notes0;
      legajomax02 := legajo;
    end;

    if (notes10 > max10) then begin
      max102 := max10;
      legajoMax102 := legajoMax10;

      max10 := notes10;
      legajoMax10 := legajo;
    end
    else if (notes10 > max102) then begin
      max102 := notes10;
      legajomax102 := legajo;
    end;

    writeln('Ingresantes en condicion de rendir el parcial: ', parcialIng, ' (', totalIng/parcialIng*100,'%)');
    writeln('Recursantes en condicion de rendir el parcial: ', parcialRe, ' (', totalRe/parcialRe*100,'%)');
    writeln('Alumnos que aprobaron todas las evaluaciones: ', passAll);
    writeln('Alumnos con promedio mejor a 6.5: ', avg6);
    writeln('Alumnos que obtuvieron 0 en almenos una evaluacion: ', zInOneCount);
    writeln('Los 2 alumnos con mas 10: ', max10, ' ', max102);
    writeln('Los 2 alumnos con mas 0: ', max0, ' ', max02);
  end;
end.