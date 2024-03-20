program P1E7;

type
    novela = record
        codigo: integer;
        precio: real;
        genero: String[20];
        nombre: String[50];
    end;

    arch_novelas = file of novela;

procedure crearArchivo(var arch: arch_novelas);
var
    txt: Text;
    nov: novela;
begin
    Assign(txt, 'novelas.txt');
    Reset(txt);
    Rewrite(nov);
end;