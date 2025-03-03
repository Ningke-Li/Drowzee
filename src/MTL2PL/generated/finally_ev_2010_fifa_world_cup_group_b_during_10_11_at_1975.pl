:- include('database.pl').
ev_2010_fifa_world_cup_group_b(Start,End) :- begin('ev_2010_fifa_world_cup_group_b',_,_,Start), end('ev_2010_fifa_world_cup_group_b',_,_,End), Start=<End.

finally_ev_2010_fifa_world_cup_group_b_during_10_11(Start,End) :- ev_2010_fifa_world_cup_group_b(Start1,End1), (Start1-11)=<(End1-10), Start is (Start1-11), End is (End1-10), Start=<End.

finally_ev_2010_fifa_world_cup_group_b_during_10_11_at_1975(Res) :- setof((Start,End),finally_ev_2010_fifa_world_cup_group_b_during_10_11(Start,End),AllINtervals), checkvalidity(1975,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2010_fifa_world_cup_group_b_during_10_11_at_1975'), (finally_ev_2010_fifa_world_cup_group_b_during_10_11_at_1975(true) -> write('\nRes   = true');write('\nRes   = false')).

