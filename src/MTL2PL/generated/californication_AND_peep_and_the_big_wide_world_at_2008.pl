:- include('database.pl').
californication(Start,End) :- begin('californication',_,_,Start), end('californication',_,_,End), Start=<End.

peep_and_the_big_wide_world(Start,End) :- begin('peep_and_the_big_wide_world',_,_,Start), end('peep_and_the_big_wide_world',_,_,End), Start=<End.

generate_facts_californication_AND_peep_and_the_big_wide_world([]) :- assert(californication_AND_peep_and_the_big_wide_world(-1,-1)).

generate_facts_californication_AND_peep_and_the_big_wide_world([(Start,End) | Tail]) :- assert(californication_AND_peep_and_the_big_wide_world(Start,End)), generate_facts_californication_AND_peep_and_the_big_wide_world(Tail).

californication_AND_peep_and_the_big_wide_world_aux() :- findall((Start,End),californication(Start,End),Interval1), findall((Start,End),peep_and_the_big_wide_world(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_californication_AND_peep_and_the_big_wide_world(Interval).

californication_AND_peep_and_the_big_wide_world_at_2008(Res) :- setof((Start,End),californication_AND_peep_and_the_big_wide_world(Start,End),AllINtervals), checkvalidity(2008,AllINtervals,Res).

check_query() :- write('Query = californication_AND_peep_and_the_big_wide_world_at_2008'), (californication_AND_peep_and_the_big_wide_world_at_2008(true) -> write('\nRes   = true');write('\nRes   = false')).
?- californication_AND_peep_and_the_big_wide_world_aux().

