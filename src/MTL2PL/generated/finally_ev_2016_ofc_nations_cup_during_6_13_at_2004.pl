:- include('database.pl').
ev_2016_ofc_nations_cup(Start,End) :- begin('ev_2016_ofc_nations_cup',_,_,Start), end('ev_2016_ofc_nations_cup',_,_,End), Start=<End.

finally_ev_2016_ofc_nations_cup_during_6_13(Start,End) :- ev_2016_ofc_nations_cup(Start1,End1), (Start1-13)=<(End1-6), Start is (Start1-13), End is (End1-6), Start=<End.

finally_ev_2016_ofc_nations_cup_during_6_13_at_2004(Res) :- setof((Start,End),finally_ev_2016_ofc_nations_cup_during_6_13(Start,End),AllINtervals), checkvalidity(2004,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2016_ofc_nations_cup_during_6_13_at_2004'), (finally_ev_2016_ofc_nations_cup_during_6_13_at_2004(true) -> write('\nRes   = true');write('\nRes   = false')).

