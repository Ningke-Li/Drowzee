:- include('database.pl').
ev_1408(Start,End) :- begin('ev_1408',_,_,Start), end('ev_1408',_,_,End), Start=<End.

next_ev_1408(Start,End) :- ev_1408(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_1408_at_1341(Res) :- setof((Start,End),next_ev_1408(Start,End),AllINtervals), checkvalidity(1341,AllINtervals,Res).

check_query() :- write('Query = next_ev_1408_at_1341'), (next_ev_1408_at_1341(true) -> write('\nRes   = true');write('\nRes   = false')).

