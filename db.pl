%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ayuda(S0,S):-emergencia(S0,S).

saludos(S0,S):- saludo(S0,S).

salir(S0,S):- salida(S0,S).

ayuda(S0,S):-emergencia(S0,S1), emergencia(S1,S).

permiso(a,S0,S):-query(S0,S1),accion(a,S1,S).

permiso(b,S0,S):-query(S0,S1),accion(b,S1,S).

query(S0,S):-solicitud(S0,S1),nombre(q,S1,S).

query(S0,S):-solicitud(S0,S).

accion(a,S0,S):-linker(S0,S1),verbo(a,S1,S).

accion(a,S0,S):-verbo(a,S0,S).

accion(b,S0,S):-linker(S0,S1),verbo(b,S1,S).

accion(b,S0,S):-verbo(b,S0,S).

emergenciaid(S0,S):-sintagma_verbal(S0,S1),sintagma_nominal(S1,S).

sintagma_verbal(S0,S):-verbo(th,S0,S1),determinante(S1,S).

sintagma_verbal(S0,S):-verbo(th,S0,S).

sintagma_nominal(S0,S):-determinante(S0,S1),tipoEmergencia(S0,S1).

sintagma_nominal(S0,S):-tipoEmergencia(S0,S).

donde(S0,S):-determinante(u,S0,S1),determinante(S1,S).

donde(S0,S):-determinante(u,S0,S).

lugarFallo(S0,S):-donde(S0,S1),nombre(objeto,S1,S).

tipoEmergencia(S0,S):-nombre(f,S0,S1),lugarFallo(S1,S).

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

nombre(f,[falla|S],S).

nombre(f,[fuego|S],S).

nombre(f,[fallo|S],S).

nombre(f,[error|S],S).

nombre(objeto,[motor|S],S).

nombre(objeto,[sistema|S],S).

solicitud([necesito|S],S).

solicitud([quiero|S],S).

determinante([mi|S],S).

determinante([una|S],S).

determinante([un|S],S).

determinante([el|S],S).

determinante(u,[en|S],S).

determinante([la|S],S).

verbo(a,[despegar|S],S).

verbo(a,[volar|S],S).

verbo(ser,[es|S],S).

verbo(th,[tengo|S],S).

verbo(th,[tiene|S],S).

salida([gracias|S],S).

salida([listo|S],S).

salida([adios],S).

verbo(th,[hay|S],S).

verbo(b,[aterrizar|S],S).

linker([para|S],S).

emergencia(['MayDay'|S],S).

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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

despegar(Y):-
    permiso(a,Y,[]),write('\nPor favor identifiquese!!: '),read(XX), tokenize_atom(XX, YY),id(YY),write('Tienes permiso para despegar\n').


aterrizar(Y):-
    (permiso(b,Y,[])),write('\nPor favor identifiquese!!: '),read(XX), tokenize_atom(XX, YY),id(YY),write('Tienes permiso para aterrizar\n').

id(Y):-
    ((identificacion(Y,[]));
    (identificacion(aeronave,Y,[]),write('Ingrese su matricula: '),read(XX),tokenize_atom(XX,YY),(nombre(matricula,YY,[]);identificacion(matricula,YY,[])),indicar_pista([],Y));
    (identificacion(matricula,Y,[]),write('Ingrese su aeronave:'),read(XX),tokenize_atom(XX,YY),(nombre(aeronaves,YY,[]);identificacion(aeronave,Y,[])),indicar_pista([],YY))).

peticion():-
    write('Hola, en que te puedo ayudar? '),read(X), tokenize_atom(X, Y),(despegar(Y);aterrizar(Y)),main().

emergencias():-
     write('Cual es su emergencia? '),read(X), tokenize_atom(X, Y),emergenciaid(Y,[]),write('\nPor favor identifiquese!!: '),read(XX), tokenize_atom(XX, YY),id(YY),write('\nPista asignada'),main().

main():-
    read(X), tokenize_atom(X, Y),((saludos(Y,[]),peticion());(ayuda(Y,[]),emergencias());(salir(Y,[]),write('gracias por utilizar MayCEy'))).