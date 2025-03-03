:- include('database.pl').
ev_2010_fifa_world_cup_group_f(Start,End) :- begin('ev_2010_fifa_world_cup_group_f',_,_,Start), end('ev_2010_fifa_world_cup_group_f',_,_,End), Start=<End.

finally_ev_2010_fifa_world_cup_group_f_during_3_20(Start,End) :- ev_2010_fifa_world_cup_group_f(Start1,End1), (Start1-20)=<(End1-3), Start is (Start1-20), End is (End1-3), Start=<End.

finally_ev_2010_fifa_world_cup_group_f_during_3_20_at_1997(Res) :- setof((Start,End),finally_ev_2010_fifa_world_cup_group_f_during_3_20(Start,End),AllINtervals), checkvalidity(1997,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2010_fifa_world_cup_group_f_during_3_20_at_1997'), (finally_ev_2010_fifa_world_cup_group_f_during_3_20_at_1997(true) -> write('\nRes   = true');write('\nRes   = false')).

