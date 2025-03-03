:- include('database.pl').
ev_2010_fifa_world_cup_group_c(Start,End) :- begin('ev_2010_fifa_world_cup_group_c',_,_,Start), end('ev_2010_fifa_world_cup_group_c',_,_,End), Start=<End.

finally_ev_2010_fifa_world_cup_group_c_during_4_17(Start,End) :- ev_2010_fifa_world_cup_group_c(Start1,End1), (Start1-17)=<(End1-4), Start is (Start1-17), End is (End1-4), Start=<End.

finally_ev_2010_fifa_world_cup_group_c_during_4_17_at_2004(Res) :- setof((Start,End),finally_ev_2010_fifa_world_cup_group_c_during_4_17(Start,End),AllINtervals), checkvalidity(2004,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2010_fifa_world_cup_group_c_during_4_17_at_2004'), (finally_ev_2010_fifa_world_cup_group_c_during_4_17_at_2004(true) -> write('\nRes   = true');write('\nRes   = false')).

