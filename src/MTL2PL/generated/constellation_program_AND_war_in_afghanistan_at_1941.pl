:- include('database.pl').
constellation_program(Start,End) :- begin('constellation_program',_,_,Start), end('constellation_program',_,_,End), Start=<End.

war_in_afghanistan(Start,End) :- begin('war_in_afghanistan',_,_,Start), end('war_in_afghanistan',_,_,End), Start=<End.

generate_facts_constellation_program_AND_war_in_afghanistan([]) :- assert(constellation_program_AND_war_in_afghanistan(-1,-1)).

generate_facts_constellation_program_AND_war_in_afghanistan([(Start,End) | Tail]) :- assert(constellation_program_AND_war_in_afghanistan(Start,End)), generate_facts_constellation_program_AND_war_in_afghanistan(Tail).

constellation_program_AND_war_in_afghanistan_aux() :- findall((Start,End),constellation_program(Start,End),Interval1), findall((Start,End),war_in_afghanistan(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_constellation_program_AND_war_in_afghanistan(Interval).

constellation_program_AND_war_in_afghanistan_at_1941(Res) :- setof((Start,End),constellation_program_AND_war_in_afghanistan(Start,End),AllINtervals), checkvalidity(1941,AllINtervals,Res).

check_query() :- write('Query = constellation_program_AND_war_in_afghanistan_at_1941'), (constellation_program_AND_war_in_afghanistan_at_1941(true) -> write('\nRes   = true');write('\nRes   = false')).
?- constellation_program_AND_war_in_afghanistan_aux().

