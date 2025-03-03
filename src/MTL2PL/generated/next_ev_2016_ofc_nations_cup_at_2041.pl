:- include('database.pl').
ev_2016_ofc_nations_cup(Start,End) :- begin('ev_2016_ofc_nations_cup',_,_,Start), end('ev_2016_ofc_nations_cup',_,_,End), Start=<End.

next_ev_2016_ofc_nations_cup(Start,End) :- ev_2016_ofc_nations_cup(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_2016_ofc_nations_cup_at_2041(Res) :- setof((Start,End),next_ev_2016_ofc_nations_cup(Start,End),AllINtervals), checkvalidity(2041,AllINtervals,Res).

check_query() :- write('Query = next_ev_2016_ofc_nations_cup_at_2041'), (next_ev_2016_ofc_nations_cup_at_2041(true) -> write('\nRes   = true');write('\nRes   = false')).

