program Ejer12P2P2;

const
    zone1 = 6;
    zone2 = 2.6;
    zone3 = 1.4;
    tnDeSoja = 320;

function performancePerHa(hectareas, zone: integer; price: real): real;
    begin
        case zone of
            1: performancePerHa := zone1 * hectareas * price;
            2: performancePerHa := zone2 * hectareas * price;
            3: performancePerHa := zone3 * hectareas * price;
        end;
    end;

begin
    // TODO: terminar la parte B de esta actividad
end.