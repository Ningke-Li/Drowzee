:- include('database.pl').
jewish_exodus_from_the_muslim_world(Start,End) :- begin('jewish_exodus_from_the_muslim_world',_,_,Start), end('jewish_exodus_from_the_muslim_world',_,_,End), Start=<End.

battle_of_stalingrad(Start,End) :- begin('battle_of_stalingrad',_,_,Start), end('battle_of_stalingrad',_,_,End), Start=<End.

generate_facts_jewish_exodus_from_the_muslim_world_AND_battle_of_stalingrad([]) :- assert(jewish_exodus_from_the_muslim_world_AND_battle_of_stalingrad(-1,-1)).

generate_facts_jewish_exodus_from_the_muslim_world_AND_battle_of_stalingrad([(Start,End) | Tail]) :- assert(jewish_exodus_from_the_muslim_world_AND_battle_of_stalingrad(Start,End)), generate_facts_jewish_exodus_from_the_muslim_world_AND_battle_of_stalingrad(Tail).

jewish_exodus_from_the_muslim_world_AND_battle_of_stalingrad_aux() :- findall((Start,End),jewish_exodus_from_the_muslim_world(Start,End),Interval1), findall((Start,End),battle_of_stalingrad(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_jewish_exodus_from_the_muslim_world_AND_battle_of_stalingrad(Interval).

jewish_exodus_from_the_muslim_world_AND_battle_of_stalingrad_at_1829(Res) :- setof((Start,End),jewish_exodus_from_the_muslim_world_AND_battle_of_stalingrad(Start,End),AllINtervals), checkvalidity(1829,AllINtervals,Res).

check_query() :- write('Query = jewish_exodus_from_the_muslim_world_AND_battle_of_stalingrad_at_1829'), (jewish_exodus_from_the_muslim_world_AND_battle_of_stalingrad_at_1829(true) -> write('\nRes   = true');write('\nRes   = false')).
?- jewish_exodus_from_the_muslim_world_AND_battle_of_stalingrad_aux().

