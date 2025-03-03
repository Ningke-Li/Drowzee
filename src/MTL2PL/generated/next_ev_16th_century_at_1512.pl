:- include('database.pl').
ev_16th_century(Start,End) :- begin('ev_16th_century',_,_,Start), end('ev_16th_century',_,_,End), Start=<End.

next_ev_16th_century(Start,End) :- ev_16th_century(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_16th_century_at_1512(Res) :- setof((Start,End),next_ev_16th_century(Start,End),AllINtervals), checkvalidity(1512,AllINtervals,Res).

check_query() :- write('Query = next_ev_16th_century_at_1512'), (next_ev_16th_century_at_1512(true) -> write('\nRes   = true');write('\nRes   = false')).

