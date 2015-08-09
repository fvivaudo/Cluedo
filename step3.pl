action([X, X, Chevre, Chou], du_loup(X, Y), [Y, Y, Chevre, Chou]).
action([X, Loup, X, Chou], de_la_chevre(X, Y), [Y, Loup, Y, Chou]).
action([X, Loup, Chevre, X], du_chou(X, Y), [Y, Loup, Chevre, Y]).
action([X, Loup, Chevre, Chou], du_peon_Solitaire(X, Y), [Y, Loup, Chevre, Chou]).

equals(X,X).

survivra([Peon, Loup, Chevre, Chou]) :-
	equals(Peon, Chevre);
	(equals(Peon, Loup), equals(Peon, Chou)).

goal([est, est, est, est], []).
goal(OldState, [Action|Tail]) :-
	action(OldState, Action, NewState),
	survivra(NewState),
	goal(NewState, Tail),
	write('Deplacement '), write(Action), nl.


solve :- length(X, 7), goal([ouest, ouest, ouest, ouest], X).