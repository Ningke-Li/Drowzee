:- include('database.pl').
ev_20th_century(Start,End) :- begin('ev_20th_century',_,_,Start), end('ev_20th_century',_,_,End), Start=<End.

next_ev_20th_century(Start,End) :- ev_20th_century(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_20th_century_at_1771(Res) :- setof((Start,End),next_ev_20th_century(Start,End),AllINtervals), checkvalidity(1771,AllINtervals,Res).

check_query() :- write('Query = next_ev_20th_century_at_1771'), (next_ev_20th_century_at_1771(true) -> write('\nRes   = true');write('\nRes   = false')).

