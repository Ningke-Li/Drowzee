:- include('database.pl').
ev_1550s(Start,End) :- begin('ev_1550s',_,_,Start), end('ev_1550s',_,_,End), Start=<End.

next_ev_1550s(Start,End) :- ev_1550s(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_1550s_at_1591(Res) :- setof((Start,End),next_ev_1550s(Start,End),AllINtervals), checkvalidity(1591,AllINtervals,Res).

check_query() :- write('Query = next_ev_1550s_at_1591'), (next_ev_1550s_at_1591(true) -> write('\nRes   = true');write('\nRes   = false')).

