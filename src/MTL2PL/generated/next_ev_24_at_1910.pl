:- include('database.pl').
ev_24(Start,End) :- begin('ev_24',_,_,Start), end('ev_24',_,_,End), Start=<End.

next_ev_24(Start,End) :- ev_24(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_24_at_1910(Res) :- setof((Start,End),next_ev_24(Start,End),AllINtervals), checkvalidity(1910,AllINtervals,Res).

check_query() :- write('Query = next_ev_24_at_1910'), (next_ev_24_at_1910(true) -> write('\nRes   = true');write('\nRes   = false')).

