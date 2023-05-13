program Ejer12P4;
const
    dimF = 53;
type
    galaxyType = 1..4;
    galaxy = record
        name: string;
        galType: galaxyType;
        mass, distance: real;
    end;
    vector = array[1..dimF] of galaxy;

begin
    
end.