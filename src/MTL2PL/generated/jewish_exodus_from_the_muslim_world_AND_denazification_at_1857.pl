:- include('database.pl').
jewish_exodus_from_the_muslim_world(Start,End) :- begin('jewish_exodus_from_the_muslim_world',_,_,Start), end('jewish_exodus_from_the_muslim_world',_,_,End), Start=<End.

denazification(Start,End) :- begin('denazification',_,_,Start), end('denazification',_,_,End), Start=<End.

generate_facts_jewish_exodus_from_the_muslim_world_AND_denazification([]) :- assert(jewish_exodus_from_the_muslim_world_AND_denazification(-1,-1)).

generate_facts_jewish_exodus_from_the_muslim_world_AND_denazification([(Start,End) | Tail]) :- assert(jewish_exodus_from_the_muslim_world_AND_denazification(Start,End)), generate_facts_jewish_exodus_from_the_muslim_world_AND_denazification(Tail).

jewish_exodus_from_the_muslim_world_AND_denazification_aux() :- findall((Start,End),jewish_exodus_from_the_muslim_world(Start,End),Interval1), findall((Start,End),denazification(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_jewish_exodus_from_the_muslim_world_AND_denazification(Interval).

jewish_exodus_from_the_muslim_world_AND_denazification_at_1857(Res) :- setof((Start,End),jewish_exodus_from_the_muslim_world_AND_denazification(Start,End),AllINtervals), checkvalidity(1857,AllINtervals,Res).

check_query() :- write('Query = jewish_exodus_from_the_muslim_world_AND_denazification_at_1857'), (jewish_exodus_from_the_muslim_world_AND_denazification_at_1857(true) -> write('\nRes   = true');write('\nRes   = false')).
?- jewish_exodus_from_the_muslim_world_AND_denazification_aux().

