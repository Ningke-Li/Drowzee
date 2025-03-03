:- include('database.pl').
peep_and_the_big_wide_world(Start,End) :- begin('peep_and_the_big_wide_world',_,_,Start), end('peep_and_the_big_wide_world',_,_,End), Start=<End.

percy_jackson___the_olympians(Start,End) :- begin('percy_jackson___the_olympians',_,_,Start), end('percy_jackson___the_olympians',_,_,End), Start=<End.

generate_facts_peep_and_the_big_wide_world_AND_percy_jackson___the_olympians([]) :- assert(peep_and_the_big_wide_world_AND_percy_jackson___the_olympians(-1,-1)).

generate_facts_peep_and_the_big_wide_world_AND_percy_jackson___the_olympians([(Start,End) | Tail]) :- assert(peep_and_the_big_wide_world_AND_percy_jackson___the_olympians(Start,End)), generate_facts_peep_and_the_big_wide_world_AND_percy_jackson___the_olympians(Tail).

peep_and_the_big_wide_world_AND_percy_jackson___the_olympians_aux() :- findall((Start,End),peep_and_the_big_wide_world(Start,End),Interval1), findall((Start,End),percy_jackson___the_olympians(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_peep_and_the_big_wide_world_AND_percy_jackson___the_olympians(Interval).

peep_and_the_big_wide_world_AND_percy_jackson___the_olympians_at_2006(Res) :- setof((Start,End),peep_and_the_big_wide_world_AND_percy_jackson___the_olympians(Start,End),AllINtervals), checkvalidity(2006,AllINtervals,Res).

check_query() :- write('Query = peep_and_the_big_wide_world_AND_percy_jackson___the_olympians_at_2006'), (peep_and_the_big_wide_world_AND_percy_jackson___the_olympians_at_2006(true) -> write('\nRes   = true');write('\nRes   = false')).
?- peep_and_the_big_wide_world_AND_percy_jackson___the_olympians_aux().

