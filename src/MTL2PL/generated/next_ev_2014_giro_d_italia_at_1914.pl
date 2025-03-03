:- include('database.pl').
ev_2014_giro_d_italia(Start,End) :- begin('ev_2014_giro_d_italia',_,_,Start), end('ev_2014_giro_d_italia',_,_,End), Start=<End.

next_ev_2014_giro_d_italia(Start,End) :- ev_2014_giro_d_italia(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_2014_giro_d_italia_at_1914(Res) :- setof((Start,End),next_ev_2014_giro_d_italia(Start,End),AllINtervals), checkvalidity(1914,AllINtervals,Res).

check_query() :- write('Query = next_ev_2014_giro_d_italia_at_1914'), (next_ev_2014_giro_d_italia_at_1914(true) -> write('\nRes   = true');write('\nRes   = false')).

