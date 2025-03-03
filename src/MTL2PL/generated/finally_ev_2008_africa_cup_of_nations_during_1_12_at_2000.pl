:- include('database.pl').
ev_2008_africa_cup_of_nations(Start,End) :- begin('ev_2008_africa_cup_of_nations',_,_,Start), end('ev_2008_africa_cup_of_nations',_,_,End), Start=<End.

finally_ev_2008_africa_cup_of_nations_during_1_12(Start,End) :- ev_2008_africa_cup_of_nations(Start1,End1), (Start1-12)=<(End1-1), Start is (Start1-12), End is (End1-1), Start=<End.

finally_ev_2008_africa_cup_of_nations_during_1_12_at_2000(Res) :- setof((Start,End),finally_ev_2008_africa_cup_of_nations_during_1_12(Start,End),AllINtervals), checkvalidity(2000,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2008_africa_cup_of_nations_during_1_12_at_2000'), (finally_ev_2008_africa_cup_of_nations_during_1_12_at_2000(true) -> write('\nRes   = true');write('\nRes   = false')).

