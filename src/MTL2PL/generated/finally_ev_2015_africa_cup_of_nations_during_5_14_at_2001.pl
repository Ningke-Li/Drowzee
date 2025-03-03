:- include('database.pl').
ev_2015_africa_cup_of_nations(Start,End) :- begin('ev_2015_africa_cup_of_nations',_,_,Start), end('ev_2015_africa_cup_of_nations',_,_,End), Start=<End.

finally_ev_2015_africa_cup_of_nations_during_5_14(Start,End) :- ev_2015_africa_cup_of_nations(Start1,End1), (Start1-14)=<(End1-5), Start is (Start1-14), End is (End1-5), Start=<End.

finally_ev_2015_africa_cup_of_nations_during_5_14_at_2001(Res) :- setof((Start,End),finally_ev_2015_africa_cup_of_nations_during_5_14(Start,End),AllINtervals), checkvalidity(2001,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2015_africa_cup_of_nations_during_5_14_at_2001'), (finally_ev_2015_africa_cup_of_nations_during_5_14_at_2001(true) -> write('\nRes   = true');write('\nRes   = false')).

