:- include('database.pl').
white__migr_(Start,End) :- begin('white__migr_',_,_,Start), end('white__migr_',_,_,End), Start=<End.

ev_2010_fifa_world_cup_group_a(Start,End) :- begin('ev_2010_fifa_world_cup_group_a',_,_,Start), end('ev_2010_fifa_world_cup_group_a',_,_,End), Start=<End.

generate_facts_white__migr__OR_ev_2010_fifa_world_cup_group_a([]) :- assert(white__migr__OR_ev_2010_fifa_world_cup_group_a(-1,-1)).

generate_facts_white__migr__OR_ev_2010_fifa_world_cup_group_a([(Start,End) | Tail]) :- assert(white__migr__OR_ev_2010_fifa_world_cup_group_a(Start,End)), generate_facts_white__migr__OR_ev_2010_fifa_world_cup_group_a(Tail).

white__migr__OR_ev_2010_fifa_world_cup_group_a_aux() :- findall((Start,End),white__migr_(Start,End),Interval1), findall((Start,End),ev_2010_fifa_world_cup_group_a(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_white__migr__OR_ev_2010_fifa_world_cup_group_a(Interval).

white__migr__OR_ev_2010_fifa_world_cup_group_a_at_1797(Res) :- setof((Start,End),white__migr__OR_ev_2010_fifa_world_cup_group_a(Start,End),AllINtervals), checkvalidity(1797,AllINtervals,Res).

check_query() :- write('Query = white__migr__OR_ev_2010_fifa_world_cup_group_a_at_1797'), (white__migr__OR_ev_2010_fifa_world_cup_group_a_at_1797(true) -> write('\nRes   = true');write('\nRes   = false')).
?- white__migr__OR_ev_2010_fifa_world_cup_group_a_aux().

