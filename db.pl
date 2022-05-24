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

nombre(aeronaves,['Embraer Phenom'|S],S).

nombre(aeronaves,['Boing 717'|S],S).

nombre(aeronaves,['Embraer 190'|S],S).

nombre(aeronaves,['AirBus A0'|S],S).

nombre(aeronaves,['Boing 747'|S],S).

nombre(aeronaves,['AirBus A340'|S],S).

nombre(aeronaves,['Airbus A380'|S],S).

nombre(pistas,['P1'|S],S).

nombre(pistas,['P1-(Este a Oeste)'|S],S).

nombre(pistas,['P'|S],S).

nombre(pistas,['P-(Oeste a Este)'|S],S).

nombre(matricula,['BNF00'|S],S).

nombre(matricula,['BNF01'|S],S).

nombre(matricula,['BNF02'|S],S).

nombre(matricula,['BNF03'|S],S).

exit_words(1,[exit|S],S).

%%%%
%REGLAS
exitkeyword(Y):-
    exit_words(1,Y,[]),write('Saliendo...'), halt(0).

despegar(Y):-
    permiso(a,Y,[]),write('Tienes permiso para despegar \n').

aterrizar(Y):-
    (permiso(id,Y,[]);permiso(b,Y,[])),write('Tienes permiso para aterrizar \n').

id(Y):-
    ((identificacion(Y,[]),write('Continuar...'));
    (identificacion(aeronave,Y,[]),write('Ingrese su matricula: '),read(X),tokenize_atom(X,S),nombre(matricula,S,[]));
    (identificacion(matricula,Y,[]),write('Ingrese su aeronave:'),read(X),tokenize_atom(X,S),nombre(aeronaves,S,[]))).
saludo(Y):-
    sintagma_nominal(s,Y,[]), write('Hola! En que te puedo ayuda?').