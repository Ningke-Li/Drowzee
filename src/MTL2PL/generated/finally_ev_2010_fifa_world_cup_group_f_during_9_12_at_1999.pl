:- include('database.pl').
ev_2010_fifa_world_cup_group_f(Start,End) :- begin('ev_2010_fifa_world_cup_group_f',_,_,Start), end('ev_2010_fifa_world_cup_group_f',_,_,End), Start=<End.

finally_ev_2010_fifa_world_cup_group_f_during_9_12(Start,End) :- ev_2010_fifa_world_cup_group_f(Start1,End1), (Start1-12)=<(End1-9), Start is (Start1-12), End is (End1-9), Start=<End.

finally_ev_2010_fifa_world_cup_group_f_during_9_12_at_1999(Res) :- setof((Start,End),finally_ev_2010_fifa_world_cup_group_f_during_9_12(Start,End),AllINtervals), checkvalidity(1999,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2010_fifa_world_cup_group_f_during_9_12_at_1999'), (finally_ev_2010_fifa_world_cup_group_f_during_9_12_at_1999(true) -> write('\nRes   = true');write('\nRes   = false')).

