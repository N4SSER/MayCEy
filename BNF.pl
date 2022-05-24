permiso(a,S0,S):-query(S0,S1),accion(a,S1,S).

permiso(b,S0,S):-query(S0,S1),accion(b,S1,S).

permiso(id,S0,S):-permiso(b,S0,S1),identificacion(S1,S).

query(S0,S):-solicitud(S0,S1),nombre(q,S1,S).

query(S0,S):-solicitud(S0,S).

accion(a,S0,S):-linker(S0,S1),verbo(a,S1,S).

accion(a,S0,S):-verbo(a,S0,S).

accion(b,S0,S):-linker(S0,S1),verbo(b,S1,S).

accion(b,S0,S):-verbo(b,S0,S).

identificacion(aeronave,S0,S):-sintagma_nominal(aeronave,S0,S1),sintagma_verbal(S1,S).

sintagma_nominal(aeronave,S0,S):-determinante(S0,S1),nombre(aero,S1,S).

sintagma_nominal(aeronave,S0,S):-nombre(aero,S0,S).

sintagma_nominal(aeronave,id,S0,S):-nombre(aeronaves,S0,S).

sintagma_verbal(S0,S):-verbo(ser,S0,S).

sintagma_verbal(S0,S):-verbo(ser,S0,S1),sintagma_nominal(aeronave,id,S1,S).

identificacion(matricula,S0,S):-sintagma_nominal(matricula,S0,S1),sintagma_verbal(S1,S).

sintagma_nominal(matricula,S0,S):-determinante(S0,S1),nombre(id,S1,S).

sintagma_nominal(matricula,S0,S):-nombre(id,S0,S).

sintagma_nominal(matricula,id,S0,S):-nombre(matricula,S0,S).

sintagma_nominal(s,S0,S):-saludo(S0,S).

sintagma_verbal(S0,S):-verbo(ser,S0,S1),sintagma_nominal(matricula,id,S1,S).

identificacion(S0,S):-identificacion(aeronave,S0,S1),identificacion(matricula,S1,S).

identificacion(S0,S):-identificacion(matricula,S0,S1),identificacion(aeronave,S1,S).

main():-
    (write('Que desea hacer: '),read(X), tokenize_atom(X, Y)) ,(despegar(Y);aterrizar(Y);id(Y);exitkeyword(Y)),main(P);(write('No entendi lo que dijiste, reformulalo por favor \n'),main(repeat)).

main(P):-
    (read(X), tokenize_atom(X, Y)) ,(despegar(Y);aterrizar(Y);id(Y);exitkeyword(Y)),main(P);(write('No entendi~` lo que dijiste, reformulalo por favor \n'),main()).
