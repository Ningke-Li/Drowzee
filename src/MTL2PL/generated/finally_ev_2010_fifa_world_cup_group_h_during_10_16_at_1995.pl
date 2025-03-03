:- include('database.pl').
ev_2010_fifa_world_cup_group_h(Start,End) :- begin('ev_2010_fifa_world_cup_group_h',_,_,Start), end('ev_2010_fifa_world_cup_group_h',_,_,End), Start=<End.

finally_ev_2010_fifa_world_cup_group_h_during_10_16(Start,End) :- ev_2010_fifa_world_cup_group_h(Start1,End1), (Start1-16)=<(End1-10), Start is (Start1-16), End is (End1-10), Start=<End.

finally_ev_2010_fifa_world_cup_group_h_during_10_16_at_1995(Res) :- setof((Start,End),finally_ev_2010_fifa_world_cup_group_h_during_10_16(Start,End),AllINtervals), checkvalidity(1995,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2010_fifa_world_cup_group_h_during_10_16_at_1995'), (finally_ev_2010_fifa_world_cup_group_h_during_10_16_at_1995(true) -> write('\nRes   = true');write('\nRes   = false')).

