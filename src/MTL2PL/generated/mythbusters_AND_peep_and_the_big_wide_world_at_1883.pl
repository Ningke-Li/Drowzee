:- include('database.pl').
mythbusters(Start,End) :- begin('mythbusters',_,_,Start), end('mythbusters',_,_,End), Start=<End.

peep_and_the_big_wide_world(Start,End) :- begin('peep_and_the_big_wide_world',_,_,Start), end('peep_and_the_big_wide_world',_,_,End), Start=<End.

generate_facts_mythbusters_AND_peep_and_the_big_wide_world([]) :- assert(mythbusters_AND_peep_and_the_big_wide_world(-1,-1)).

generate_facts_mythbusters_AND_peep_and_the_big_wide_world([(Start,End) | Tail]) :- assert(mythbusters_AND_peep_and_the_big_wide_world(Start,End)), generate_facts_mythbusters_AND_peep_and_the_big_wide_world(Tail).

mythbusters_AND_peep_and_the_big_wide_world_aux() :- findall((Start,End),mythbusters(Start,End),Interval1), findall((Start,End),peep_and_the_big_wide_world(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_mythbusters_AND_peep_and_the_big_wide_world(Interval).

mythbusters_AND_peep_and_the_big_wide_world_at_1883(Res) :- setof((Start,End),mythbusters_AND_peep_and_the_big_wide_world(Start,End),AllINtervals), checkvalidity(1883,AllINtervals,Res).

check_query() :- write('Query = mythbusters_AND_peep_and_the_big_wide_world_at_1883'), (mythbusters_AND_peep_and_the_big_wide_world_at_1883(true) -> write('\nRes   = true');write('\nRes   = false')).
?- mythbusters_AND_peep_and_the_big_wide_world_aux().

