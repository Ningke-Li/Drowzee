:- include('database.pl').
first_wave_feminism(Start,End) :- begin('first_wave_feminism',_,_,Start), end('first_wave_feminism',_,_,End), Start=<End.

manhattan_project(Start,End) :- begin('manhattan_project',_,_,Start), end('manhattan_project',_,_,End), Start=<End.

generate_facts_first_wave_feminism_AND_manhattan_project([]) :- assert(first_wave_feminism_AND_manhattan_project(-1,-1)).

generate_facts_first_wave_feminism_AND_manhattan_project([(Start,End) | Tail]) :- assert(first_wave_feminism_AND_manhattan_project(Start,End)), generate_facts_first_wave_feminism_AND_manhattan_project(Tail).

first_wave_feminism_AND_manhattan_project_aux() :- findall((Start,End),first_wave_feminism(Start,End),Interval1), findall((Start,End),manhattan_project(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_first_wave_feminism_AND_manhattan_project(Interval).

first_wave_feminism_AND_manhattan_project_at_1939(Res) :- setof((Start,End),first_wave_feminism_AND_manhattan_project(Start,End),AllINtervals), checkvalidity(1939,AllINtervals,Res).

check_query() :- write('Query = first_wave_feminism_AND_manhattan_project_at_1939'), (first_wave_feminism_AND_manhattan_project_at_1939(true) -> write('\nRes   = true');write('\nRes   = false')).
?- first_wave_feminism_AND_manhattan_project_aux().

