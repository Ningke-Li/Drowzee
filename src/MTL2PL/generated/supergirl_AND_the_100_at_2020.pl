:- include('database.pl').
supergirl(Start,End) :- begin('supergirl',_,_,Start), end('supergirl',_,_,End), Start=<End.

the_100(Start,End) :- begin('the_100',_,_,Start), end('the_100',_,_,End), Start=<End.

generate_facts_supergirl_AND_the_100([]) :- assert(supergirl_AND_the_100(-1,-1)).

generate_facts_supergirl_AND_the_100([(Start,End) | Tail]) :- assert(supergirl_AND_the_100(Start,End)), generate_facts_supergirl_AND_the_100(Tail).

supergirl_AND_the_100_aux() :- findall((Start,End),supergirl(Start,End),Interval1), findall((Start,End),the_100(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_supergirl_AND_the_100(Interval).

supergirl_AND_the_100_at_2020(Res) :- setof((Start,End),supergirl_AND_the_100(Start,End),AllINtervals), checkvalidity(2020,AllINtervals,Res).

check_query() :- write('Query = supergirl_AND_the_100_at_2020'), (supergirl_AND_the_100_at_2020(true) -> write('\nRes   = true');write('\nRes   = false')).
?- supergirl_AND_the_100_aux().

