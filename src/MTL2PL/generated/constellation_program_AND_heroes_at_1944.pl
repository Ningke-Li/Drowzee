:- include('database.pl').
constellation_program(Start,End) :- begin('constellation_program',_,_,Start), end('constellation_program',_,_,End), Start=<End.

heroes(Start,End) :- begin('heroes',_,_,Start), end('heroes',_,_,End), Start=<End.

generate_facts_constellation_program_AND_heroes([]) :- assert(constellation_program_AND_heroes(-1,-1)).

generate_facts_constellation_program_AND_heroes([(Start,End) | Tail]) :- assert(constellation_program_AND_heroes(Start,End)), generate_facts_constellation_program_AND_heroes(Tail).

constellation_program_AND_heroes_aux() :- findall((Start,End),constellation_program(Start,End),Interval1), findall((Start,End),heroes(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_constellation_program_AND_heroes(Interval).

constellation_program_AND_heroes_at_1944(Res) :- setof((Start,End),constellation_program_AND_heroes(Start,End),AllINtervals), checkvalidity(1944,AllINtervals,Res).

check_query() :- write('Query = constellation_program_AND_heroes_at_1944'), (constellation_program_AND_heroes_at_1944(true) -> write('\nRes   = true');write('\nRes   = false')).
?- constellation_program_AND_heroes_aux().

