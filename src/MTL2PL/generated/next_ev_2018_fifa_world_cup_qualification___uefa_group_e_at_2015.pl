:- include('database.pl').
ev_2018_fifa_world_cup_qualification___uefa_group_e(Start,End) :- begin('ev_2018_fifa_world_cup_qualification___uefa_group_e',_,_,Start), end('ev_2018_fifa_world_cup_qualification___uefa_group_e',_,_,End), Start=<End.

next_ev_2018_fifa_world_cup_qualification___uefa_group_e(Start,End) :- ev_2018_fifa_world_cup_qualification___uefa_group_e(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_2018_fifa_world_cup_qualification___uefa_group_e_at_2015(Res) :- setof((Start,End),next_ev_2018_fifa_world_cup_qualification___uefa_group_e(Start,End),AllINtervals), checkvalidity(2015,AllINtervals,Res).

check_query() :- write('Query = next_ev_2018_fifa_world_cup_qualification___uefa_group_e_at_2015'), (next_ev_2018_fifa_world_cup_qualification___uefa_group_e_at_2015(true) -> write('\nRes   = true');write('\nRes   = false')).

