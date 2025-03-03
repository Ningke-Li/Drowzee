:- include('database.pl').
ev_2014_fifa_world_cup_qualification(Start,End) :- begin('ev_2014_fifa_world_cup_qualification',_,_,Start), end('ev_2014_fifa_world_cup_qualification',_,_,End), Start=<End.

finally_ev_2014_fifa_world_cup_qualification_during_3_17(Start,End) :- ev_2014_fifa_world_cup_qualification(Start1,End1), (Start1-17)=<(End1-3), Start is (Start1-17), End is (End1-3), Start=<End.

finally_ev_2014_fifa_world_cup_qualification_during_3_17_at_2005(Res) :- setof((Start,End),finally_ev_2014_fifa_world_cup_qualification_during_3_17(Start,End),AllINtervals), checkvalidity(2005,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2014_fifa_world_cup_qualification_during_3_17_at_2005'), (finally_ev_2014_fifa_world_cup_qualification_during_3_17_at_2005(true) -> write('\nRes   = true');write('\nRes   = false')).

