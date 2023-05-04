program Ejer11P4;
const
    dimF = 200;
type
    photo = record
        title, author: string;
        likes, comments, clicks: integer;
    end;

    vector = array[1..dimF] of photo;

procedure readPhoto(var p: photo);
begin
    readln(p.title);
    readln(p.author);
    readln(p.likes);
    readln(p.comments);
    readln(p.clicks);
end;

procedure readVector(var v: vector);
var
    i: integer;
begin
    for i := 1 to dimF do
        readPhoto(v[i]);
end;

function mostViewedPhoto(v: vector): string;
var
    i, max: integer;
    title: string;
begin
    max := -1;
    for i := 1 to dimF do begin
        if (v[i].clicks > max) then begin
            max := v[i].clicks;
            title := v[i].title;
        end;
    end;
    mostViewedPhoto := title;
end;

function likesForAuthor(v: vector; author: string): integer;
var
    i, likes: integer;
begin
    likes := 0;
    for i := 1 to dimF do begin
        if (v[i].author = author) then
            likes := likes + v[i].likes;
    end;

    likesForAuthor := likes;
end;

procedure printComments(v: vector);
var
    i: integer;
begin
    writeln('Cantidad de comentarios por foto:');
    for i := 1 to dimF do
        writeln(v[i].title, ': ', v[i].comments);
end;

var
    v: vector;

begin
    readVector(v);
    writeln('El titulo de la foto mas vista es: ', mostViewedPhoto(v));
    writeln('La cantidad de likes para el autor Art Vandelay: ', likesForAuthor(v, 'Art Vandelay'));
    printComments(v);
end.