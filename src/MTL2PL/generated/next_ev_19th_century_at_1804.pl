:- include('database.pl').
ev_19th_century(Start,End) :- begin('ev_19th_century',_,_,Start), end('ev_19th_century',_,_,End), Start=<End.

next_ev_19th_century(Start,End) :- ev_19th_century(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_19th_century_at_1804(Res) :- setof((Start,End),next_ev_19th_century(Start,End),AllINtervals), checkvalidity(1804,AllINtervals,Res).

check_query() :- write('Query = next_ev_19th_century_at_1804'), (next_ev_19th_century_at_1804(true) -> write('\nRes   = true');write('\nRes   = false')).

