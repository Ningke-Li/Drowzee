:- include('database.pl').
ev_1720s(Start,End) :- begin('ev_1720s',_,_,Start), end('ev_1720s',_,_,End), Start=<End.

next_ev_1720s(Start,End) :- ev_1720s(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_1720s_at_1744(Res) :- setof((Start,End),next_ev_1720s(Start,End),AllINtervals), checkvalidity(1744,AllINtervals,Res).

check_query() :- write('Query = next_ev_1720s_at_1744'), (next_ev_1720s_at_1744(true) -> write('\nRes   = true');write('\nRes   = false')).

