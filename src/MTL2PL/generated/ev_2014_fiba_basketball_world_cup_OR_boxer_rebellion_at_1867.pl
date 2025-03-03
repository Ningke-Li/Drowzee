:- include('database.pl').
ev_2014_fiba_basketball_world_cup(Start,End) :- begin('ev_2014_fiba_basketball_world_cup',_,_,Start), end('ev_2014_fiba_basketball_world_cup',_,_,End), Start=<End.

boxer_rebellion(Start,End) :- begin('boxer_rebellion',_,_,Start), end('boxer_rebellion',_,_,End), Start=<End.

generate_facts_ev_2014_fiba_basketball_world_cup_OR_boxer_rebellion([]) :- assert(ev_2014_fiba_basketball_world_cup_OR_boxer_rebellion(-1,-1)).

generate_facts_ev_2014_fiba_basketball_world_cup_OR_boxer_rebellion([(Start,End) | Tail]) :- assert(ev_2014_fiba_basketball_world_cup_OR_boxer_rebellion(Start,End)), generate_facts_ev_2014_fiba_basketball_world_cup_OR_boxer_rebellion(Tail).

ev_2014_fiba_basketball_world_cup_OR_boxer_rebellion_aux() :- findall((Start,End),ev_2014_fiba_basketball_world_cup(Start,End),Interval1), findall((Start,End),boxer_rebellion(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2014_fiba_basketball_world_cup_OR_boxer_rebellion(Interval).

ev_2014_fiba_basketball_world_cup_OR_boxer_rebellion_at_1867(Res) :- setof((Start,End),ev_2014_fiba_basketball_world_cup_OR_boxer_rebellion(Start,End),AllINtervals), checkvalidity(1867,AllINtervals,Res).

check_query() :- write('Query = ev_2014_fiba_basketball_world_cup_OR_boxer_rebellion_at_1867'), (ev_2014_fiba_basketball_world_cup_OR_boxer_rebellion_at_1867(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2014_fiba_basketball_world_cup_OR_boxer_rebellion_aux().

