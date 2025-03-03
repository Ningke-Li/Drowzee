:- include('database.pl').
ev_2017_giro_d_italia(Start,End) :- begin('ev_2017_giro_d_italia',_,_,Start), end('ev_2017_giro_d_italia',_,_,End), Start=<End.

next_ev_2017_giro_d_italia(Start,End) :- ev_2017_giro_d_italia(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_2017_giro_d_italia_at_2007(Res) :- setof((Start,End),next_ev_2017_giro_d_italia(Start,End),AllINtervals), checkvalidity(2007,AllINtervals,Res).

check_query() :- write('Query = next_ev_2017_giro_d_italia_at_2007'), (next_ev_2017_giro_d_italia_at_2007(true) -> write('\nRes   = true');write('\nRes   = false')).

