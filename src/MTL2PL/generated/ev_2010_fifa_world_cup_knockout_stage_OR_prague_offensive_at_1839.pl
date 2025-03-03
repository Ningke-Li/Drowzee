:- include('database.pl').
ev_2010_fifa_world_cup_knockout_stage(Start,End) :- begin('ev_2010_fifa_world_cup_knockout_stage',_,_,Start), end('ev_2010_fifa_world_cup_knockout_stage',_,_,End), Start=<End.

prague_offensive(Start,End) :- begin('prague_offensive',_,_,Start), end('prague_offensive',_,_,End), Start=<End.

generate_facts_ev_2010_fifa_world_cup_knockout_stage_OR_prague_offensive([]) :- assert(ev_2010_fifa_world_cup_knockout_stage_OR_prague_offensive(-1,-1)).

generate_facts_ev_2010_fifa_world_cup_knockout_stage_OR_prague_offensive([(Start,End) | Tail]) :- assert(ev_2010_fifa_world_cup_knockout_stage_OR_prague_offensive(Start,End)), generate_facts_ev_2010_fifa_world_cup_knockout_stage_OR_prague_offensive(Tail).

ev_2010_fifa_world_cup_knockout_stage_OR_prague_offensive_aux() :- findall((Start,End),ev_2010_fifa_world_cup_knockout_stage(Start,End),Interval1), findall((Start,End),prague_offensive(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2010_fifa_world_cup_knockout_stage_OR_prague_offensive(Interval).

ev_2010_fifa_world_cup_knockout_stage_OR_prague_offensive_at_1839(Res) :- setof((Start,End),ev_2010_fifa_world_cup_knockout_stage_OR_prague_offensive(Start,End),AllINtervals), checkvalidity(1839,AllINtervals,Res).

check_query() :- write('Query = ev_2010_fifa_world_cup_knockout_stage_OR_prague_offensive_at_1839'), (ev_2010_fifa_world_cup_knockout_stage_OR_prague_offensive_at_1839(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2010_fifa_world_cup_knockout_stage_OR_prague_offensive_aux().

