:- include('database.pl').
ev_1941(Start,End) :- begin('ev_1941',_,_,Start), end('ev_1941',_,_,End), Start=<End.

next_ev_1941(Start,End) :- ev_1941(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_1941_at_1940(Res) :- setof((Start,End),next_ev_1941(Start,End),AllINtervals), checkvalidity(1940,AllINtervals,Res).

check_query() :- write('Query = next_ev_1941_at_1940'), (next_ev_1941_at_1940(true) -> write('\nRes   = true');write('\nRes   = false')).

