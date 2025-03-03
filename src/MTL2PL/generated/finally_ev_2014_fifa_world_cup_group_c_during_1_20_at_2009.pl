:- include('database.pl').
ev_2014_fifa_world_cup_group_c(Start,End) :- begin('ev_2014_fifa_world_cup_group_c',_,_,Start), end('ev_2014_fifa_world_cup_group_c',_,_,End), Start=<End.

finally_ev_2014_fifa_world_cup_group_c_during_1_20(Start,End) :- ev_2014_fifa_world_cup_group_c(Start1,End1), (Start1-20)=<(End1-1), Start is (Start1-20), End is (End1-1), Start=<End.

finally_ev_2014_fifa_world_cup_group_c_during_1_20_at_2009(Res) :- setof((Start,End),finally_ev_2014_fifa_world_cup_group_c_during_1_20(Start,End),AllINtervals), checkvalidity(2009,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2014_fifa_world_cup_group_c_during_1_20_at_2009'), (finally_ev_2014_fifa_world_cup_group_c_during_1_20_at_2009(true) -> write('\nRes   = true');write('\nRes   = false')).

