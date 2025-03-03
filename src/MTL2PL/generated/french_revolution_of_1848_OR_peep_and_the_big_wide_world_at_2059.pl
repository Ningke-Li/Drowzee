:- include('database.pl').
french_revolution_of_1848(Start,End) :- begin('french_revolution_of_1848',_,_,Start), end('french_revolution_of_1848',_,_,End), Start=<End.

peep_and_the_big_wide_world(Start,End) :- begin('peep_and_the_big_wide_world',_,_,Start), end('peep_and_the_big_wide_world',_,_,End), Start=<End.

generate_facts_french_revolution_of_1848_OR_peep_and_the_big_wide_world([]) :- assert(french_revolution_of_1848_OR_peep_and_the_big_wide_world(-1,-1)).

generate_facts_french_revolution_of_1848_OR_peep_and_the_big_wide_world([(Start,End) | Tail]) :- assert(french_revolution_of_1848_OR_peep_and_the_big_wide_world(Start,End)), generate_facts_french_revolution_of_1848_OR_peep_and_the_big_wide_world(Tail).

french_revolution_of_1848_OR_peep_and_the_big_wide_world_aux() :- findall((Start,End),french_revolution_of_1848(Start,End),Interval1), findall((Start,End),peep_and_the_big_wide_world(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_french_revolution_of_1848_OR_peep_and_the_big_wide_world(Interval).

french_revolution_of_1848_OR_peep_and_the_big_wide_world_at_2059(Res) :- setof((Start,End),french_revolution_of_1848_OR_peep_and_the_big_wide_world(Start,End),AllINtervals), checkvalidity(2059,AllINtervals,Res).

check_query() :- write('Query = french_revolution_of_1848_OR_peep_and_the_big_wide_world_at_2059'), (french_revolution_of_1848_OR_peep_and_the_big_wide_world_at_2059(true) -> write('\nRes   = true');write('\nRes   = false')).
?- french_revolution_of_1848_OR_peep_and_the_big_wide_world_aux().

