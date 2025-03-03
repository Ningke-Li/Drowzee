:- include('database.pl').
ev_2018_fifa_world_cup_qualification(Start,End) :- begin('ev_2018_fifa_world_cup_qualification',_,_,Start), end('ev_2018_fifa_world_cup_qualification',_,_,End), Start=<End.

under_the_dome(Start,End) :- begin('under_the_dome',_,_,Start), end('under_the_dome',_,_,End), Start=<End.

generate_facts_ev_2018_fifa_world_cup_qualification_OR_under_the_dome([]) :- assert(ev_2018_fifa_world_cup_qualification_OR_under_the_dome(-1,-1)).

generate_facts_ev_2018_fifa_world_cup_qualification_OR_under_the_dome([(Start,End) | Tail]) :- assert(ev_2018_fifa_world_cup_qualification_OR_under_the_dome(Start,End)), generate_facts_ev_2018_fifa_world_cup_qualification_OR_under_the_dome(Tail).

ev_2018_fifa_world_cup_qualification_OR_under_the_dome_aux() :- findall((Start,End),ev_2018_fifa_world_cup_qualification(Start,End),Interval1), findall((Start,End),under_the_dome(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2018_fifa_world_cup_qualification_OR_under_the_dome(Interval).

ev_2018_fifa_world_cup_qualification_OR_under_the_dome_at_1886(Res) :- setof((Start,End),ev_2018_fifa_world_cup_qualification_OR_under_the_dome(Start,End),AllINtervals), checkvalidity(1886,AllINtervals,Res).

check_query() :- write('Query = ev_2018_fifa_world_cup_qualification_OR_under_the_dome_at_1886'), (ev_2018_fifa_world_cup_qualification_OR_under_the_dome_at_1886(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2018_fifa_world_cup_qualification_OR_under_the_dome_aux().

