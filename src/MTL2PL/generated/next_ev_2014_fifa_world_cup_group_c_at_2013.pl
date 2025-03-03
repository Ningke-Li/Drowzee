:- include('database.pl').
ev_2014_fifa_world_cup_group_c(Start,End) :- begin('ev_2014_fifa_world_cup_group_c',_,_,Start), end('ev_2014_fifa_world_cup_group_c',_,_,End), Start=<End.

next_ev_2014_fifa_world_cup_group_c(Start,End) :- ev_2014_fifa_world_cup_group_c(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_2014_fifa_world_cup_group_c_at_2013(Res) :- setof((Start,End),next_ev_2014_fifa_world_cup_group_c(Start,End),AllINtervals), checkvalidity(2013,AllINtervals,Res).

check_query() :- write('Query = next_ev_2014_fifa_world_cup_group_c_at_2013'), (next_ev_2014_fifa_world_cup_group_c_at_2013(true) -> write('\nRes   = true');write('\nRes   = false')).

