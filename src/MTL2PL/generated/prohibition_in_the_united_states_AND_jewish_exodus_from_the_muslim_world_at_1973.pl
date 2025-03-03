:- include('database.pl').
prohibition_in_the_united_states(Start,End) :- begin('prohibition_in_the_united_states',_,_,Start), end('prohibition_in_the_united_states',_,_,End), Start=<End.

jewish_exodus_from_the_muslim_world(Start,End) :- begin('jewish_exodus_from_the_muslim_world',_,_,Start), end('jewish_exodus_from_the_muslim_world',_,_,End), Start=<End.

generate_facts_prohibition_in_the_united_states_AND_jewish_exodus_from_the_muslim_world([]) :- assert(prohibition_in_the_united_states_AND_jewish_exodus_from_the_muslim_world(-1,-1)).

generate_facts_prohibition_in_the_united_states_AND_jewish_exodus_from_the_muslim_world([(Start,End) | Tail]) :- assert(prohibition_in_the_united_states_AND_jewish_exodus_from_the_muslim_world(Start,End)), generate_facts_prohibition_in_the_united_states_AND_jewish_exodus_from_the_muslim_world(Tail).

prohibition_in_the_united_states_AND_jewish_exodus_from_the_muslim_world_aux() :- findall((Start,End),prohibition_in_the_united_states(Start,End),Interval1), findall((Start,End),jewish_exodus_from_the_muslim_world(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_prohibition_in_the_united_states_AND_jewish_exodus_from_the_muslim_world(Interval).

prohibition_in_the_united_states_AND_jewish_exodus_from_the_muslim_world_at_1973(Res) :- setof((Start,End),prohibition_in_the_united_states_AND_jewish_exodus_from_the_muslim_world(Start,End),AllINtervals), checkvalidity(1973,AllINtervals,Res).

check_query() :- write('Query = prohibition_in_the_united_states_AND_jewish_exodus_from_the_muslim_world_at_1973'), (prohibition_in_the_united_states_AND_jewish_exodus_from_the_muslim_world_at_1973(true) -> write('\nRes   = true');write('\nRes   = false')).
?- prohibition_in_the_united_states_AND_jewish_exodus_from_the_muslim_world_aux().

