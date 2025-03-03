:- include('database.pl').
ev_2006_fifa_world_cup(Start,End) :- begin('ev_2006_fifa_world_cup',_,_,Start), end('ev_2006_fifa_world_cup',_,_,End), Start=<End.

finally_ev_2006_fifa_world_cup_during_6_18(Start,End) :- ev_2006_fifa_world_cup(Start1,End1), (Start1-18)=<(End1-6), Start is (Start1-18), End is (End1-6), Start=<End.

finally_ev_2006_fifa_world_cup_during_6_18_at_1845(Res) :- setof((Start,End),finally_ev_2006_fifa_world_cup_during_6_18(Start,End),AllINtervals), checkvalidity(1845,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2006_fifa_world_cup_during_6_18_at_1845'), (finally_ev_2006_fifa_world_cup_during_6_18_at_1845(true) -> write('\nRes   = true');write('\nRes   = false')).

