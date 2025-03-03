:- include('database.pl').
scandal(Start,End) :- begin('scandal',_,_,Start), end('scandal',_,_,End), Start=<End.

ev_2018_fifa_world_cup_qualification(Start,End) :- begin('ev_2018_fifa_world_cup_qualification',_,_,Start), end('ev_2018_fifa_world_cup_qualification',_,_,End), Start=<End.

generate_facts_scandal_AND_ev_2018_fifa_world_cup_qualification([]) :- assert(scandal_AND_ev_2018_fifa_world_cup_qualification(-1,-1)).

generate_facts_scandal_AND_ev_2018_fifa_world_cup_qualification([(Start,End) | Tail]) :- assert(scandal_AND_ev_2018_fifa_world_cup_qualification(Start,End)), generate_facts_scandal_AND_ev_2018_fifa_world_cup_qualification(Tail).

scandal_AND_ev_2018_fifa_world_cup_qualification_aux() :- findall((Start,End),scandal(Start,End),Interval1), findall((Start,End),ev_2018_fifa_world_cup_qualification(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_scandal_AND_ev_2018_fifa_world_cup_qualification(Interval).

scandal_AND_ev_2018_fifa_world_cup_qualification_at_1868(Res) :- setof((Start,End),scandal_AND_ev_2018_fifa_world_cup_qualification(Start,End),AllINtervals), checkvalidity(1868,AllINtervals,Res).

check_query() :- write('Query = scandal_AND_ev_2018_fifa_world_cup_qualification_at_1868'), (scandal_AND_ev_2018_fifa_world_cup_qualification_at_1868(true) -> write('\nRes   = true');write('\nRes   = false')).
?- scandal_AND_ev_2018_fifa_world_cup_qualification_aux().

