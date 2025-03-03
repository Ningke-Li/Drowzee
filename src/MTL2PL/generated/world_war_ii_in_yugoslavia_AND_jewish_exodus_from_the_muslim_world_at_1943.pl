:- include('database.pl').
world_war_ii_in_yugoslavia(Start,End) :- begin('world_war_ii_in_yugoslavia',_,_,Start), end('world_war_ii_in_yugoslavia',_,_,End), Start=<End.

jewish_exodus_from_the_muslim_world(Start,End) :- begin('jewish_exodus_from_the_muslim_world',_,_,Start), end('jewish_exodus_from_the_muslim_world',_,_,End), Start=<End.

generate_facts_world_war_ii_in_yugoslavia_AND_jewish_exodus_from_the_muslim_world([]) :- assert(world_war_ii_in_yugoslavia_AND_jewish_exodus_from_the_muslim_world(-1,-1)).

generate_facts_world_war_ii_in_yugoslavia_AND_jewish_exodus_from_the_muslim_world([(Start,End) | Tail]) :- assert(world_war_ii_in_yugoslavia_AND_jewish_exodus_from_the_muslim_world(Start,End)), generate_facts_world_war_ii_in_yugoslavia_AND_jewish_exodus_from_the_muslim_world(Tail).

world_war_ii_in_yugoslavia_AND_jewish_exodus_from_the_muslim_world_aux() :- findall((Start,End),world_war_ii_in_yugoslavia(Start,End),Interval1), findall((Start,End),jewish_exodus_from_the_muslim_world(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_world_war_ii_in_yugoslavia_AND_jewish_exodus_from_the_muslim_world(Interval).

world_war_ii_in_yugoslavia_AND_jewish_exodus_from_the_muslim_world_at_1943(Res) :- setof((Start,End),world_war_ii_in_yugoslavia_AND_jewish_exodus_from_the_muslim_world(Start,End),AllINtervals), checkvalidity(1943,AllINtervals,Res).

check_query() :- write('Query = world_war_ii_in_yugoslavia_AND_jewish_exodus_from_the_muslim_world_at_1943'), (world_war_ii_in_yugoslavia_AND_jewish_exodus_from_the_muslim_world_at_1943(true) -> write('\nRes   = true');write('\nRes   = false')).
?- world_war_ii_in_yugoslavia_AND_jewish_exodus_from_the_muslim_world_aux().

