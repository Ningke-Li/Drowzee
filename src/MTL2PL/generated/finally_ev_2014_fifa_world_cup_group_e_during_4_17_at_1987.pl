:- include('database.pl').
ev_2014_fifa_world_cup_group_e(Start,End) :- begin('ev_2014_fifa_world_cup_group_e',_,_,Start), end('ev_2014_fifa_world_cup_group_e',_,_,End), Start=<End.

finally_ev_2014_fifa_world_cup_group_e_during_4_17(Start,End) :- ev_2014_fifa_world_cup_group_e(Start1,End1), (Start1-17)=<(End1-4), Start is (Start1-17), End is (End1-4), Start=<End.

finally_ev_2014_fifa_world_cup_group_e_during_4_17_at_1987(Res) :- setof((Start,End),finally_ev_2014_fifa_world_cup_group_e_during_4_17(Start,End),AllINtervals), checkvalidity(1987,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2014_fifa_world_cup_group_e_during_4_17_at_1987'), (finally_ev_2014_fifa_world_cup_group_e_during_4_17_at_1987(true) -> write('\nRes   = true');write('\nRes   = false')).

