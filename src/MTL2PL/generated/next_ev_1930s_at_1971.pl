:- include('database.pl').
ev_1930s(Start,End) :- begin('ev_1930s',_,_,Start), end('ev_1930s',_,_,End), Start=<End.

next_ev_1930s(Start,End) :- ev_1930s(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_1930s_at_1971(Res) :- setof((Start,End),next_ev_1930s(Start,End),AllINtervals), checkvalidity(1971,AllINtervals,Res).

check_query() :- write('Query = next_ev_1930s_at_1971'), (next_ev_1930s_at_1971(true) -> write('\nRes   = true');write('\nRes   = false')).

