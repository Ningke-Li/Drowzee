:- include('database.pl').
ev_2002_fifa_world_cup(Start,End) :- begin('ev_2002_fifa_world_cup',_,_,Start), end('ev_2002_fifa_world_cup',_,_,End), Start=<End.

operation_crossroads(Start,End) :- begin('operation_crossroads',_,_,Start), end('operation_crossroads',_,_,End), Start=<End.

generate_facts_ev_2002_fifa_world_cup_OR_operation_crossroads([]) :- assert(ev_2002_fifa_world_cup_OR_operation_crossroads(-1,-1)).

generate_facts_ev_2002_fifa_world_cup_OR_operation_crossroads([(Start,End) | Tail]) :- assert(ev_2002_fifa_world_cup_OR_operation_crossroads(Start,End)), generate_facts_ev_2002_fifa_world_cup_OR_operation_crossroads(Tail).

ev_2002_fifa_world_cup_OR_operation_crossroads_aux() :- findall((Start,End),ev_2002_fifa_world_cup(Start,End),Interval1), findall((Start,End),operation_crossroads(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2002_fifa_world_cup_OR_operation_crossroads(Interval).

ev_2002_fifa_world_cup_OR_operation_crossroads_at_1854(Res) :- setof((Start,End),ev_2002_fifa_world_cup_OR_operation_crossroads(Start,End),AllINtervals), checkvalidity(1854,AllINtervals,Res).

check_query() :- write('Query = ev_2002_fifa_world_cup_OR_operation_crossroads_at_1854'), (ev_2002_fifa_world_cup_OR_operation_crossroads_at_1854(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2002_fifa_world_cup_OR_operation_crossroads_aux().

