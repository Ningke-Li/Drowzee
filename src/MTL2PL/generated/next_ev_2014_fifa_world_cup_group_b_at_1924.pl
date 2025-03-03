:- include('database.pl').
ev_2014_fifa_world_cup_group_b(Start,End) :- begin('ev_2014_fifa_world_cup_group_b',_,_,Start), end('ev_2014_fifa_world_cup_group_b',_,_,End), Start=<End.

next_ev_2014_fifa_world_cup_group_b(Start,End) :- ev_2014_fifa_world_cup_group_b(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_2014_fifa_world_cup_group_b_at_1924(Res) :- setof((Start,End),next_ev_2014_fifa_world_cup_group_b(Start,End),AllINtervals), checkvalidity(1924,AllINtervals,Res).

check_query() :- write('Query = next_ev_2014_fifa_world_cup_group_b_at_1924'), (next_ev_2014_fifa_world_cup_group_b_at_1924(true) -> write('\nRes   = true');write('\nRes   = false')).

