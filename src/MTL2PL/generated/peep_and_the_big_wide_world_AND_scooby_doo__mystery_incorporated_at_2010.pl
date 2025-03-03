:- include('database.pl').
peep_and_the_big_wide_world(Start,End) :- begin('peep_and_the_big_wide_world',_,_,Start), end('peep_and_the_big_wide_world',_,_,End), Start=<End.

scooby_doo__mystery_incorporated(Start,End) :- begin('scooby_doo__mystery_incorporated',_,_,Start), end('scooby_doo__mystery_incorporated',_,_,End), Start=<End.

generate_facts_peep_and_the_big_wide_world_AND_scooby_doo__mystery_incorporated([]) :- assert(peep_and_the_big_wide_world_AND_scooby_doo__mystery_incorporated(-1,-1)).

generate_facts_peep_and_the_big_wide_world_AND_scooby_doo__mystery_incorporated([(Start,End) | Tail]) :- assert(peep_and_the_big_wide_world_AND_scooby_doo__mystery_incorporated(Start,End)), generate_facts_peep_and_the_big_wide_world_AND_scooby_doo__mystery_incorporated(Tail).

peep_and_the_big_wide_world_AND_scooby_doo__mystery_incorporated_aux() :- findall((Start,End),peep_and_the_big_wide_world(Start,End),Interval1), findall((Start,End),scooby_doo__mystery_incorporated(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_peep_and_the_big_wide_world_AND_scooby_doo__mystery_incorporated(Interval).

peep_and_the_big_wide_world_AND_scooby_doo__mystery_incorporated_at_2010(Res) :- setof((Start,End),peep_and_the_big_wide_world_AND_scooby_doo__mystery_incorporated(Start,End),AllINtervals), checkvalidity(2010,AllINtervals,Res).

check_query() :- write('Query = peep_and_the_big_wide_world_AND_scooby_doo__mystery_incorporated_at_2010'), (peep_and_the_big_wide_world_AND_scooby_doo__mystery_incorporated_at_2010(true) -> write('\nRes   = true');write('\nRes   = false')).
?- peep_and_the_big_wide_world_AND_scooby_doo__mystery_incorporated_aux().

