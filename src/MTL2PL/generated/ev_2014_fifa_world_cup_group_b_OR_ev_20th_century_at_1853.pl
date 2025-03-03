:- include('database.pl').
ev_2014_fifa_world_cup_group_b(Start,End) :- begin('ev_2014_fifa_world_cup_group_b',_,_,Start), end('ev_2014_fifa_world_cup_group_b',_,_,End), Start=<End.

ev_20th_century(Start,End) :- begin('ev_20th_century',_,_,Start), end('ev_20th_century',_,_,End), Start=<End.

generate_facts_ev_2014_fifa_world_cup_group_b_OR_ev_20th_century([]) :- assert(ev_2014_fifa_world_cup_group_b_OR_ev_20th_century(-1,-1)).

generate_facts_ev_2014_fifa_world_cup_group_b_OR_ev_20th_century([(Start,End) | Tail]) :- assert(ev_2014_fifa_world_cup_group_b_OR_ev_20th_century(Start,End)), generate_facts_ev_2014_fifa_world_cup_group_b_OR_ev_20th_century(Tail).

ev_2014_fifa_world_cup_group_b_OR_ev_20th_century_aux() :- findall((Start,End),ev_2014_fifa_world_cup_group_b(Start,End),Interval1), findall((Start,End),ev_20th_century(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2014_fifa_world_cup_group_b_OR_ev_20th_century(Interval).

ev_2014_fifa_world_cup_group_b_OR_ev_20th_century_at_1853(Res) :- setof((Start,End),ev_2014_fifa_world_cup_group_b_OR_ev_20th_century(Start,End),AllINtervals), checkvalidity(1853,AllINtervals,Res).

check_query() :- write('Query = ev_2014_fifa_world_cup_group_b_OR_ev_20th_century_at_1853'), (ev_2014_fifa_world_cup_group_b_OR_ev_20th_century_at_1853(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2014_fifa_world_cup_group_b_OR_ev_20th_century_aux().

