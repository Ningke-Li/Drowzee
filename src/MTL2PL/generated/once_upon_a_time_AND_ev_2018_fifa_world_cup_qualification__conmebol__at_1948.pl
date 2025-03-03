:- include('database.pl').
once_upon_a_time(Start,End) :- begin('once_upon_a_time',_,_,Start), end('once_upon_a_time',_,_,End), Start=<End.

ev_2018_fifa_world_cup_qualification__conmebol_(Start,End) :- begin('ev_2018_fifa_world_cup_qualification__conmebol_',_,_,Start), end('ev_2018_fifa_world_cup_qualification__conmebol_',_,_,End), Start=<End.

generate_facts_once_upon_a_time_AND_ev_2018_fifa_world_cup_qualification__conmebol_([]) :- assert(once_upon_a_time_AND_ev_2018_fifa_world_cup_qualification__conmebol_(-1,-1)).

generate_facts_once_upon_a_time_AND_ev_2018_fifa_world_cup_qualification__conmebol_([(Start,End) | Tail]) :- assert(once_upon_a_time_AND_ev_2018_fifa_world_cup_qualification__conmebol_(Start,End)), generate_facts_once_upon_a_time_AND_ev_2018_fifa_world_cup_qualification__conmebol_(Tail).

once_upon_a_time_AND_ev_2018_fifa_world_cup_qualification__conmebol__aux() :- findall((Start,End),once_upon_a_time(Start,End),Interval1), findall((Start,End),ev_2018_fifa_world_cup_qualification__conmebol_(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_once_upon_a_time_AND_ev_2018_fifa_world_cup_qualification__conmebol_(Interval).

once_upon_a_time_AND_ev_2018_fifa_world_cup_qualification__conmebol__at_1948(Res) :- setof((Start,End),once_upon_a_time_AND_ev_2018_fifa_world_cup_qualification__conmebol_(Start,End),AllINtervals), checkvalidity(1948,AllINtervals,Res).

check_query() :- write('Query = once_upon_a_time_AND_ev_2018_fifa_world_cup_qualification__conmebol__at_1948'), (once_upon_a_time_AND_ev_2018_fifa_world_cup_qualification__conmebol__at_1948(true) -> write('\nRes   = true');write('\nRes   = false')).
?- once_upon_a_time_AND_ev_2018_fifa_world_cup_qualification__conmebol__aux().

