:- include('database.pl').
world_heavyweight_championship_rey_mysterio(Start,End) :- begin('world_heavyweight_championship_rey_mysterio',_,_,Start), end('world_heavyweight_championship_rey_mysterio',_,_,End), Start=<End.

peep_and_the_big_wide_world(Start,End) :- begin('peep_and_the_big_wide_world',_,_,Start), end('peep_and_the_big_wide_world',_,_,End), Start=<End.

generate_facts_world_heavyweight_championship_rey_mysterio_AND_peep_and_the_big_wide_world([]) :- assert(world_heavyweight_championship_rey_mysterio_AND_peep_and_the_big_wide_world(-1,-1)).

generate_facts_world_heavyweight_championship_rey_mysterio_AND_peep_and_the_big_wide_world([(Start,End) | Tail]) :- assert(world_heavyweight_championship_rey_mysterio_AND_peep_and_the_big_wide_world(Start,End)), generate_facts_world_heavyweight_championship_rey_mysterio_AND_peep_and_the_big_wide_world(Tail).

world_heavyweight_championship_rey_mysterio_AND_peep_and_the_big_wide_world_aux() :- findall((Start,End),world_heavyweight_championship_rey_mysterio(Start,End),Interval1), findall((Start,End),peep_and_the_big_wide_world(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_world_heavyweight_championship_rey_mysterio_AND_peep_and_the_big_wide_world(Interval).

world_heavyweight_championship_rey_mysterio_AND_peep_and_the_big_wide_world_at_2011(Res) :- setof((Start,End),world_heavyweight_championship_rey_mysterio_AND_peep_and_the_big_wide_world(Start,End),AllINtervals), checkvalidity(2011,AllINtervals,Res).

check_query() :- write('Query = world_heavyweight_championship_rey_mysterio_AND_peep_and_the_big_wide_world_at_2011'), (world_heavyweight_championship_rey_mysterio_AND_peep_and_the_big_wide_world_at_2011(true) -> write('\nRes   = true');write('\nRes   = false')).
?- world_heavyweight_championship_rey_mysterio_AND_peep_and_the_big_wide_world_aux().

