:- include('database.pl').
dr__romantic(Start,End) :- begin('dr__romantic',_,_,Start), end('dr__romantic',_,_,End), Start=<End.

ev_2018_fifa_world_cup_qualification(Start,End) :- begin('ev_2018_fifa_world_cup_qualification',_,_,Start), end('ev_2018_fifa_world_cup_qualification',_,_,End), Start=<End.

generate_facts_dr__romantic_AND_ev_2018_fifa_world_cup_qualification([]) :- assert(dr__romantic_AND_ev_2018_fifa_world_cup_qualification(-1,-1)).

generate_facts_dr__romantic_AND_ev_2018_fifa_world_cup_qualification([(Start,End) | Tail]) :- assert(dr__romantic_AND_ev_2018_fifa_world_cup_qualification(Start,End)), generate_facts_dr__romantic_AND_ev_2018_fifa_world_cup_qualification(Tail).

dr__romantic_AND_ev_2018_fifa_world_cup_qualification_aux() :- findall((Start,End),dr__romantic(Start,End),Interval1), findall((Start,End),ev_2018_fifa_world_cup_qualification(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_dr__romantic_AND_ev_2018_fifa_world_cup_qualification(Interval).

dr__romantic_AND_ev_2018_fifa_world_cup_qualification_at_1982(Res) :- setof((Start,End),dr__romantic_AND_ev_2018_fifa_world_cup_qualification(Start,End),AllINtervals), checkvalidity(1982,AllINtervals,Res).

check_query() :- write('Query = dr__romantic_AND_ev_2018_fifa_world_cup_qualification_at_1982'), (dr__romantic_AND_ev_2018_fifa_world_cup_qualification_at_1982(true) -> write('\nRes   = true');write('\nRes   = false')).
?- dr__romantic_AND_ev_2018_fifa_world_cup_qualification_aux().

