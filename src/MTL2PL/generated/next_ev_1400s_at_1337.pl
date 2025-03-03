:- include('database.pl').
ev_1400s(Start,End) :- begin('ev_1400s',_,_,Start), end('ev_1400s',_,_,End), Start=<End.

next_ev_1400s(Start,End) :- ev_1400s(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_1400s_at_1337(Res) :- setof((Start,End),next_ev_1400s(Start,End),AllINtervals), checkvalidity(1337,AllINtervals,Res).

check_query() :- write('Query = next_ev_1400s_at_1337'), (next_ev_1400s_at_1337(true) -> write('\nRes   = true');write('\nRes   = false')).

