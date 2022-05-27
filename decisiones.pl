pequenas(A):- not(intersection(A,['Cessna','Beechcraft','EmbraerPhenom'],[])).
medianas(A):- not(intersection(A, ['Boing717','Embraer190','AirBusA0'],[])).
grandes(A):- not(intersection(A, ['Boing747','AirBusA340','AirbusA380'],[])).

oeste(D):- member('Este a Oeste',D);member('este a oeste',D);member('Este a oeste',D).
este(D):- member('Oeste a Este',D);member('oeste a este',D);member('Oeste a este',D).

ocupada('P1').
%ocupada('P2-1').
ocupada('P2-2').
%ocupada('P3').

indicar_pista_aterrizar(Direccion,Aeronave):-
    %Nave pequena. P1 libre
    (pequenas(Aeronave),not(ocupada('P1')),write('Se te ha asignado la pista P1 por 5 minutos'));

    %Nave pequena, direccion este a oeste, P1 ocupada y P2-1 libre
    (pequenas(Aeronave),ocupada('P1'),not(ocupada('P2-1')),este(Direccion),write('La pista P1 se encuentra llena, se te ha asignado la pista P2-1, por 5 minutos, por tu direccion'));

    %Nave pequena, direccion oeste a este, P1 ocupada y P2-2 libre
    (pequenas(Aeronave),ocupada('P1'),not(ocupada('P2-2')),oeste(Direccion),write('La pista P1 se encuentra llena, se te ha asignado la pista P2-2, por 5 minutos, por tu direccion'));

    %Nave pequena, direccion este a oeste. P1 y P2-1  ocupadas, P3 libre
    (pequenas(Aeronave),este(Direccion),ocupada('P1'),ocupada('P2-1'),not(ocupada('P3')),write('La pista P1 y P2-1 se encuentran llenas, se te ha asignado la pista P3, por 5 minutos'));
    
    %Nave pequena, P1, P2-1 y P2-2 ocupada, P3 libre
    (pequenas(Aeronave),oeste(Direccion),ocupada('P1'),ocupada('P2-2'),not(ocupada('P3')),write('La pista P1 y P2-2 se encuentran llenas, se te ha asignado la pista P3, por 5 minutos'));

    %Nave mediana. direccion este a oeste, P2-1 libre
    (medianas(Aeronave),not(ocupada('P2-1')),este(Direccion), write('Se te ha asignado la pista P2-1 por 5 minutos'));

    %Nave mediana. direccion este a oeste, P2-1 libre
    (medianas(Aeronave),not(ocupada('P2-2')),oeste(Direccion), write('Se te ha asignado la pista P2-2 por 5 minutos'));
    
    %Nave mediana. P2-1 llena, P3 libre
    (medianas(Aeronave),ocupada('P2-1'), not(ocupada('P3')), write('Se te ha asignado la pista P2-1'));

    %Nave grande. P3 libre
    (grandes(Aeronave),not(ocupada('P3')),write('Se te ha asignado la pista P3 por 5 minutos'));

    % P1, P2-1, P2-2 ocupada y P3 llenas
    (ocupada('P1'),ocupada('P2-1'),ocupada('P2-2'),ocupada('P3'),write('La pista P1, P2-1, P2-2 y P3 se encuentran llenas, espera 15 minutos a que se libere alguna pista compatible con tu aeronave')).
