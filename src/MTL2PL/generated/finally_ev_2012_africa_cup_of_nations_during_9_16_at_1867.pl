:- include('database.pl').
ev_2012_africa_cup_of_nations(Start,End) :- begin('ev_2012_africa_cup_of_nations',_,_,Start), end('ev_2012_africa_cup_of_nations',_,_,End), Start=<End.

finally_ev_2012_africa_cup_of_nations_during_9_16(Start,End) :- ev_2012_africa_cup_of_nations(Start1,End1), (Start1-16)=<(End1-9), Start is (Start1-16), End is (End1-9), Start=<End.

finally_ev_2012_africa_cup_of_nations_during_9_16_at_1867(Res) :- setof((Start,End),finally_ev_2012_africa_cup_of_nations_during_9_16(Start,End),AllINtervals), checkvalidity(1867,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2012_africa_cup_of_nations_during_9_16_at_1867'), (finally_ev_2012_africa_cup_of_nations_during_9_16_at_1867(true) -> write('\nRes   = true');write('\nRes   = false')).

