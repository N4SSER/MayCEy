%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
permiso(a,S0,S):-query(S0,S1),accion(a,S1,S).

permiso(b,S0,S):-query(S0,S1),accion(b,S1,S).

query(S0,S):-solicitud(S0,S1),nombre(q,S1,S).

query(S0,S):-solicitud(S0,S).

accion(a,S0,S):-linker(S0,S1),verbo(a,S1,S).

accion(a,S0,S):-verbo(a,S0,S).

accion(b,S0,S):-linker(S0,S1),verbo(b,S1,S).

accion(b,S0,S):-verbo(b,S0,S).

identificacion(aeronave,S0,S):-sintagma_nominal(aeronave,S0,S1),sintagma_verbal(a,S1,S).

sintagma_verbal(a,S0,S):-verbo(ser,S0,S1),sintagma_nominal(aeronave,id,S1,S).

sintagma_nominal(aeronave,S0,S):-determinante(S0,S1),nombre(aero,S1,S).

sintagma_nominal(aeronave,id,S0,S):-nombre(aeronaves,S0,S).

identificacion(matricula,S0,S):-sintagma_nominal(matricula,S0,S1),sintagma_verbal(m,S1,S).

sintagma_nominal(matricula,S0,S):-determinante(S0,S1),nombre(id,S1,S).

sintagma_verbal(m,S0,S):-verbo(ser,S0,S1),sintagma_nominal(matricula,id,S1,S).

sintagma_nominal(matricula,id,S0,S):-nombre(matricula,S0,S).

identificacion(S0,S):-
    ((identificacion(aeronave,S0,S1),identificacion(matricula,S1,S));
    (identificacion(matricula,S0,S1),identificacion(aeronave,S1,S))).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
saludo([hola|S],S).

saludo([saludos|S],S).

solicitud([solicito|S],S).

nombre(q,[permiso|S],S).

nombre(q,[apoyo|S],S).

solicitud([necesito|S],S).

solicitud([quiero|S],S).

determinante([mi|S],S).

determinante([el|S],S).

determinante([la|S],S).

verbo(a,[despegar|S],S).

verbo(a,[volar|S],S).

verbo(ser,[es|S],S).

verbo(b,[aterrizar|S],S).

linker([para|S],S).

nombre(aero,['aeronave'|S],S).

nombre(aero,['avion'|S],S).

nombre(id,['matricula'|S],S).

nombre(id,['placa'|S],S).

nombre(id,['id'|S],S).

nombre(aeronaves,['Cessna'|S],S).

nombre(aeronaves,['Beechcraft'|S],S).

nombre(aeronaves,['EmbraerPhenom'|S],S).

nombre(aeronaves,['Boing717'|S],S).

nombre(aeronaves,['Embraer190'|S],S).

nombre(aeronaves,['AirBusA0'|S],S).

nombre(aeronaves,['Boing747'|S],S).

nombre(aeronaves,['AirBusA340'|S],S).

nombre(aeronaves,['AirbusA380'|S],S).

nombre(pistas,['P1'|S],S).

nombre(pistas,['P1-(Este a Oeste)'|S],S).

nombre(pistas,['P'|S],S).

nombre(pistas,['P-(Oeste a Este)'|S],S).

nombre(matricula,['BNF00'|S],S).

nombre(matricula,['BNF01'|S],S).

nombre(matricula,['BNF02'|S],S).

nombre(matricula,['BNF03'|S],S).

simbolos(['.'|S],S).

simbolos([','|S],S).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

despegar(Y):-
    permiso(a,Y,[]),write('\nPor favor identifiquese!!: '),read(XX), tokenize_atom(XX, YY),id(YY),write('Tienes permiso para despegar').


aterrizar(Y):-
    (permiso(b,Y,[])),write('\nPor favor identifiquese!!: '),read(XX), tokenize_atom(XX, YY),id(YY),write('Tienes permiso para aterrizar').

id(Y):-
    ((identificacion(Y,[]),write('Contnuar...'));
    (identificacion(aeronave,Y,[]),write('Ingrese su matricula: '),read(XX),tokenize_atom(XX,YY),nombre(matricula,YY,[]));
    (identificacion(matricula,Y,[]),write('Ingrese su aeronave:'),read(XX),tokenize_atom(XX,YY),nombre(aeronaves,Y,[]))).

main():-
    write('Que desea hacer: '),read(X), tokenize_atom(X, Y),(despegar(Y);aterrizar(Y)).