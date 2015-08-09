femme(X) :- member(X, [anne, betty, lisa, sylvie, eve, julie, valerie]).

homme(X) :- member(X, [marc, luc, jean, jules, leon, loic, gerard, jacques, herve, paul]).

mari_de(marc, anne).
mari_de(luc, betty).
mari_de(jules, lisa).
mari_de(leon, sylvie).
mari_de(loic, eve).
mari_de(paul, julie).

femme_de(X, Y) :- mari_de(Y, X).

enfant_de(jean, marc).
enfant_de(jules, marc).
enfant_de(leon, marc).
enfant_de(lisa, luc).
enfant_de(loic, luc).
enfant_de(gerard, luc).
enfant_de(jacques, jules).
enfant_de(herve, leon).
enfant_de(julie, leon).
enfant_de(paul, loic).
enfant_de(valerie, loic).

enfant_de(X, Y) :- femme_de(Y, Z), enfant_de(X, Z).

beaupere_de(X, Y) :- femme_de(Z, Y), enfant_de(Z, X), homme(X).
beaupere_de(X, Y) :- mari_de(Z, Y), enfant_de(Z, X), homme(X).

bellemere_de(X, Y) :- femme_de(Z, Y), enfant_de(Z, X), femme(X).
bellemere_de(X, Y) :- mari_de(Z, Y), enfant_de(Z, X), femme(X).

ancetre_de(X, Y) :- enfant_de(Y, X).
ancetre_de(X, Y) :- enfant_de(Z, X), ancetre_de(Z, Y).
