:- include('database.pl').
legends_of_tomorrow(Start,End) :- begin('legends_of_tomorrow',_,_,Start), end('legends_of_tomorrow',_,_,End), Start=<End.

ev_2018_fifa_world_cup_qualification(Start,End) :- begin('ev_2018_fifa_world_cup_qualification',_,_,Start), end('ev_2018_fifa_world_cup_qualification',_,_,End), Start=<End.

generate_facts_legends_of_tomorrow_AND_ev_2018_fifa_world_cup_qualification([]) :- assert(legends_of_tomorrow_AND_ev_2018_fifa_world_cup_qualification(-1,-1)).

generate_facts_legends_of_tomorrow_AND_ev_2018_fifa_world_cup_qualification([(Start,End) | Tail]) :- assert(legends_of_tomorrow_AND_ev_2018_fifa_world_cup_qualification(Start,End)), generate_facts_legends_of_tomorrow_AND_ev_2018_fifa_world_cup_qualification(Tail).

legends_of_tomorrow_AND_ev_2018_fifa_world_cup_qualification_aux() :- findall((Start,End),legends_of_tomorrow(Start,End),Interval1), findall((Start,End),ev_2018_fifa_world_cup_qualification(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_legends_of_tomorrow_AND_ev_2018_fifa_world_cup_qualification(Interval).

legends_of_tomorrow_AND_ev_2018_fifa_world_cup_qualification_at_2017(Res) :- setof((Start,End),legends_of_tomorrow_AND_ev_2018_fifa_world_cup_qualification(Start,End),AllINtervals), checkvalidity(2017,AllINtervals,Res).

check_query() :- write('Query = legends_of_tomorrow_AND_ev_2018_fifa_world_cup_qualification_at_2017'), (legends_of_tomorrow_AND_ev_2018_fifa_world_cup_qualification_at_2017(true) -> write('\nRes   = true');write('\nRes   = false')).
?- legends_of_tomorrow_AND_ev_2018_fifa_world_cup_qualification_aux().

