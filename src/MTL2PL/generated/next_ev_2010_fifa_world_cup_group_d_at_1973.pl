:- include('database.pl').
ev_2010_fifa_world_cup_group_d(Start,End) :- begin('ev_2010_fifa_world_cup_group_d',_,_,Start), end('ev_2010_fifa_world_cup_group_d',_,_,End), Start=<End.

next_ev_2010_fifa_world_cup_group_d(Start,End) :- ev_2010_fifa_world_cup_group_d(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_2010_fifa_world_cup_group_d_at_1973(Res) :- setof((Start,End),next_ev_2010_fifa_world_cup_group_d(Start,End),AllINtervals), checkvalidity(1973,AllINtervals,Res).

check_query() :- write('Query = next_ev_2010_fifa_world_cup_group_d_at_1973'), (next_ev_2010_fifa_world_cup_group_d_at_1973(true) -> write('\nRes   = true');write('\nRes   = false')).

