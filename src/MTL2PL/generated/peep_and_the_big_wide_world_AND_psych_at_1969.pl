:- include('database.pl').
peep_and_the_big_wide_world(Start,End) :- begin('peep_and_the_big_wide_world',_,_,Start), end('peep_and_the_big_wide_world',_,_,End), Start=<End.

psych(Start,End) :- begin('psych',_,_,Start), end('psych',_,_,End), Start=<End.

generate_facts_peep_and_the_big_wide_world_AND_psych([]) :- assert(peep_and_the_big_wide_world_AND_psych(-1,-1)).

generate_facts_peep_and_the_big_wide_world_AND_psych([(Start,End) | Tail]) :- assert(peep_and_the_big_wide_world_AND_psych(Start,End)), generate_facts_peep_and_the_big_wide_world_AND_psych(Tail).

peep_and_the_big_wide_world_AND_psych_aux() :- findall((Start,End),peep_and_the_big_wide_world(Start,End),Interval1), findall((Start,End),psych(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_peep_and_the_big_wide_world_AND_psych(Interval).

peep_and_the_big_wide_world_AND_psych_at_1969(Res) :- setof((Start,End),peep_and_the_big_wide_world_AND_psych(Start,End),AllINtervals), checkvalidity(1969,AllINtervals,Res).

check_query() :- write('Query = peep_and_the_big_wide_world_AND_psych_at_1969'), (peep_and_the_big_wide_world_AND_psych_at_1969(true) -> write('\nRes   = true');write('\nRes   = false')).
?- peep_and_the_big_wide_world_AND_psych_aux().

