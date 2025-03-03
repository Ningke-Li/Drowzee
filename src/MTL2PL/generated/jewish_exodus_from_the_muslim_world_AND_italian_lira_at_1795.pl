:- include('database.pl').
jewish_exodus_from_the_muslim_world(Start,End) :- begin('jewish_exodus_from_the_muslim_world',_,_,Start), end('jewish_exodus_from_the_muslim_world',_,_,End), Start=<End.

italian_lira(Start,End) :- begin('italian_lira',_,_,Start), end('italian_lira',_,_,End), Start=<End.

generate_facts_jewish_exodus_from_the_muslim_world_AND_italian_lira([]) :- assert(jewish_exodus_from_the_muslim_world_AND_italian_lira(-1,-1)).

generate_facts_jewish_exodus_from_the_muslim_world_AND_italian_lira([(Start,End) | Tail]) :- assert(jewish_exodus_from_the_muslim_world_AND_italian_lira(Start,End)), generate_facts_jewish_exodus_from_the_muslim_world_AND_italian_lira(Tail).

jewish_exodus_from_the_muslim_world_AND_italian_lira_aux() :- findall((Start,End),jewish_exodus_from_the_muslim_world(Start,End),Interval1), findall((Start,End),italian_lira(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_jewish_exodus_from_the_muslim_world_AND_italian_lira(Interval).

jewish_exodus_from_the_muslim_world_AND_italian_lira_at_1795(Res) :- setof((Start,End),jewish_exodus_from_the_muslim_world_AND_italian_lira(Start,End),AllINtervals), checkvalidity(1795,AllINtervals,Res).

check_query() :- write('Query = jewish_exodus_from_the_muslim_world_AND_italian_lira_at_1795'), (jewish_exodus_from_the_muslim_world_AND_italian_lira_at_1795(true) -> write('\nRes   = true');write('\nRes   = false')).
?- jewish_exodus_from_the_muslim_world_AND_italian_lira_aux().

