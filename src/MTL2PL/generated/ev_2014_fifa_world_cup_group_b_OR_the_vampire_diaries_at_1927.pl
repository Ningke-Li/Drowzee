:- include('database.pl').
ev_2014_fifa_world_cup_group_b(Start,End) :- begin('ev_2014_fifa_world_cup_group_b',_,_,Start), end('ev_2014_fifa_world_cup_group_b',_,_,End), Start=<End.

the_vampire_diaries(Start,End) :- begin('the_vampire_diaries',_,_,Start), end('the_vampire_diaries',_,_,End), Start=<End.

generate_facts_ev_2014_fifa_world_cup_group_b_OR_the_vampire_diaries([]) :- assert(ev_2014_fifa_world_cup_group_b_OR_the_vampire_diaries(-1,-1)).

generate_facts_ev_2014_fifa_world_cup_group_b_OR_the_vampire_diaries([(Start,End) | Tail]) :- assert(ev_2014_fifa_world_cup_group_b_OR_the_vampire_diaries(Start,End)), generate_facts_ev_2014_fifa_world_cup_group_b_OR_the_vampire_diaries(Tail).

ev_2014_fifa_world_cup_group_b_OR_the_vampire_diaries_aux() :- findall((Start,End),ev_2014_fifa_world_cup_group_b(Start,End),Interval1), findall((Start,End),the_vampire_diaries(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2014_fifa_world_cup_group_b_OR_the_vampire_diaries(Interval).

ev_2014_fifa_world_cup_group_b_OR_the_vampire_diaries_at_1927(Res) :- setof((Start,End),ev_2014_fifa_world_cup_group_b_OR_the_vampire_diaries(Start,End),AllINtervals), checkvalidity(1927,AllINtervals,Res).

check_query() :- write('Query = ev_2014_fifa_world_cup_group_b_OR_the_vampire_diaries_at_1927'), (ev_2014_fifa_world_cup_group_b_OR_the_vampire_diaries_at_1927(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2014_fifa_world_cup_group_b_OR_the_vampire_diaries_aux().

