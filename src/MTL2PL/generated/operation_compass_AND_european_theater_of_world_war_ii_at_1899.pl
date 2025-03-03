:- include('database.pl').
operation_compass(Start,End) :- begin('operation_compass',_,_,Start), end('operation_compass',_,_,End), Start=<End.

european_theater_of_world_war_ii(Start,End) :- begin('european_theater_of_world_war_ii',_,_,Start), end('european_theater_of_world_war_ii',_,_,End), Start=<End.

generate_facts_operation_compass_AND_european_theater_of_world_war_ii([]) :- assert(operation_compass_AND_european_theater_of_world_war_ii(-1,-1)).

generate_facts_operation_compass_AND_european_theater_of_world_war_ii([(Start,End) | Tail]) :- assert(operation_compass_AND_european_theater_of_world_war_ii(Start,End)), generate_facts_operation_compass_AND_european_theater_of_world_war_ii(Tail).

operation_compass_AND_european_theater_of_world_war_ii_aux() :- findall((Start,End),operation_compass(Start,End),Interval1), findall((Start,End),european_theater_of_world_war_ii(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_operation_compass_AND_european_theater_of_world_war_ii(Interval).

operation_compass_AND_european_theater_of_world_war_ii_at_1899(Res) :- setof((Start,End),operation_compass_AND_european_theater_of_world_war_ii(Start,End),AllINtervals), checkvalidity(1899,AllINtervals,Res).

check_query() :- write('Query = operation_compass_AND_european_theater_of_world_war_ii_at_1899'), (operation_compass_AND_european_theater_of_world_war_ii_at_1899(true) -> write('\nRes   = true');write('\nRes   = false')).
?- operation_compass_AND_european_theater_of_world_war_ii_aux().

