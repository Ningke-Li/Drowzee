:- include('database.pl').
peep_and_the_big_wide_world(Start,End) :- begin('peep_and_the_big_wide_world',_,_,Start), end('peep_and_the_big_wide_world',_,_,End), Start=<End.

boston_legal(Start,End) :- begin('boston_legal',_,_,Start), end('boston_legal',_,_,End), Start=<End.

generate_facts_peep_and_the_big_wide_world_AND_boston_legal([]) :- assert(peep_and_the_big_wide_world_AND_boston_legal(-1,-1)).

generate_facts_peep_and_the_big_wide_world_AND_boston_legal([(Start,End) | Tail]) :- assert(peep_and_the_big_wide_world_AND_boston_legal(Start,End)), generate_facts_peep_and_the_big_wide_world_AND_boston_legal(Tail).

peep_and_the_big_wide_world_AND_boston_legal_aux() :- findall((Start,End),peep_and_the_big_wide_world(Start,End),Interval1), findall((Start,End),boston_legal(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_peep_and_the_big_wide_world_AND_boston_legal(Interval).

peep_and_the_big_wide_world_AND_boston_legal_at_1995(Res) :- setof((Start,End),peep_and_the_big_wide_world_AND_boston_legal(Start,End),AllINtervals), checkvalidity(1995,AllINtervals,Res).

check_query() :- write('Query = peep_and_the_big_wide_world_AND_boston_legal_at_1995'), (peep_and_the_big_wide_world_AND_boston_legal_at_1995(true) -> write('\nRes   = true');write('\nRes   = false')).
?- peep_and_the_big_wide_world_AND_boston_legal_aux().

