:- include('database.pl').
ev_2014_fifa_world_cup_group_h(Start,End) :- begin('ev_2014_fifa_world_cup_group_h',_,_,Start), end('ev_2014_fifa_world_cup_group_h',_,_,End), Start=<End.

finally_ev_2014_fifa_world_cup_group_h_during_3_11(Start,End) :- ev_2014_fifa_world_cup_group_h(Start1,End1), (Start1-11)=<(End1-3), Start is (Start1-11), End is (End1-3), Start=<End.

finally_ev_2014_fifa_world_cup_group_h_during_3_11_at_2026(Res) :- setof((Start,End),finally_ev_2014_fifa_world_cup_group_h_during_3_11(Start,End),AllINtervals), checkvalidity(2026,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2014_fifa_world_cup_group_h_during_3_11_at_2026'), (finally_ev_2014_fifa_world_cup_group_h_during_3_11_at_2026(true) -> write('\nRes   = true');write('\nRes   = false')).

