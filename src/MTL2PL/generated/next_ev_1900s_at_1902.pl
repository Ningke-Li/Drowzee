:- include('database.pl').
ev_1900s(Start,End) :- begin('ev_1900s',_,_,Start), end('ev_1900s',_,_,End), Start=<End.

next_ev_1900s(Start,End) :- ev_1900s(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_1900s_at_1902(Res) :- setof((Start,End),next_ev_1900s(Start,End),AllINtervals), checkvalidity(1902,AllINtervals,Res).

check_query() :- write('Query = next_ev_1900s_at_1902'), (next_ev_1900s_at_1902(true) -> write('\nRes   = true');write('\nRes   = false')).

