:- include('database.pl').
bones(Start,End) :- begin('bones',_,_,Start), end('bones',_,_,End), Start=<End.

ev_2010_fifa_world_cup_group_d(Start,End) :- begin('ev_2010_fifa_world_cup_group_d',_,_,Start), end('ev_2010_fifa_world_cup_group_d',_,_,End), Start=<End.

generate_facts_bones_OR_ev_2010_fifa_world_cup_group_d([]) :- assert(bones_OR_ev_2010_fifa_world_cup_group_d(-1,-1)).

generate_facts_bones_OR_ev_2010_fifa_world_cup_group_d([(Start,End) | Tail]) :- assert(bones_OR_ev_2010_fifa_world_cup_group_d(Start,End)), generate_facts_bones_OR_ev_2010_fifa_world_cup_group_d(Tail).

bones_OR_ev_2010_fifa_world_cup_group_d_aux() :- findall((Start,End),bones(Start,End),Interval1), findall((Start,End),ev_2010_fifa_world_cup_group_d(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_bones_OR_ev_2010_fifa_world_cup_group_d(Interval).

bones_OR_ev_2010_fifa_world_cup_group_d_at_2001(Res) :- setof((Start,End),bones_OR_ev_2010_fifa_world_cup_group_d(Start,End),AllINtervals), checkvalidity(2001,AllINtervals,Res).

check_query() :- write('Query = bones_OR_ev_2010_fifa_world_cup_group_d_at_2001'), (bones_OR_ev_2010_fifa_world_cup_group_d_at_2001(true) -> write('\nRes   = true');write('\nRes   = false')).
?- bones_OR_ev_2010_fifa_world_cup_group_d_aux().

