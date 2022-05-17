
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
permiso(S0,S):-query(S0,S1),accion(S1,S).

query(S0,S):-solicitud(S0,S1),determinante(S1,S).

query(S0,S):-solicitud(S0,S).

accion(S0,S):-linker(S0,S1),(verbo(a,S1,S);verbo(b,S1,S)).

accion(S0,S):-(verbo(a,S0,S);verbo(b,S0,S)).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
saludo([hola|S],S).

saludo([saludos|S],S).

solicitud([solicito|S],S).

determinante([permiso|S],S).

determinante([apoyo|S],S).

solicitud([necesito|S],S).

solicitud([quiero|S],S).

verbo(a,[despegar|S],S).

verbo(a,[volar|S],S).

verbo(b,[aterrizar|S],S).

linker([para|S],S).

despegar(Y):-
    permiso(Y,[]),verbo(a,[X|S],S),member(X,Y),write('Tienes permiso para despegar').

aterrizar(Y):-
    permiso(Y,[]),verbo(b,[X|S],S),member(X,Y),write('Tienes permiso para aterrizar').

main():-
    (write('Que desea hacer: '),read(X), tokenize_atom(X, Y)),(despegar(Y);aterrizar(Y)).
