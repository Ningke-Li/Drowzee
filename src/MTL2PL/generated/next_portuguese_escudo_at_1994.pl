:- include('database.pl').
portuguese_escudo(Start,End) :- begin('portuguese_escudo',_,_,Start), end('portuguese_escudo',_,_,End), Start=<End.

next_portuguese_escudo(Start,End) :- portuguese_escudo(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_portuguese_escudo_at_1994(Res) :- setof((Start,End),next_portuguese_escudo(Start,End),AllINtervals), checkvalidity(1994,AllINtervals,Res).

check_query() :- write('Query = next_portuguese_escudo_at_1994'), (next_portuguese_escudo_at_1994(true) -> write('\nRes   = true');write('\nRes   = false')).

