:- include('database.pl').
ev_3rd_millennium(Start,End) :- begin('ev_3rd_millennium',_,_,Start), end('ev_3rd_millennium',_,_,End), Start=<End.

next_ev_3rd_millennium(Start,End) :- ev_3rd_millennium(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_3rd_millennium_at_2427(Res) :- setof((Start,End),next_ev_3rd_millennium(Start,End),AllINtervals), checkvalidity(2427,AllINtervals,Res).

check_query() :- write('Query = next_ev_3rd_millennium_at_2427'), (next_ev_3rd_millennium_at_2427(true) -> write('\nRes   = true');write('\nRes   = false')).

