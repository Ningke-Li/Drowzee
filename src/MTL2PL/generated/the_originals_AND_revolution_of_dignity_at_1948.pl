:- include('database.pl').
the_originals(Start,End) :- begin('the_originals',_,_,Start), end('the_originals',_,_,End), Start=<End.

revolution_of_dignity(Start,End) :- begin('revolution_of_dignity',_,_,Start), end('revolution_of_dignity',_,_,End), Start=<End.

generate_facts_the_originals_AND_revolution_of_dignity([]) :- assert(the_originals_AND_revolution_of_dignity(-1,-1)).

generate_facts_the_originals_AND_revolution_of_dignity([(Start,End) | Tail]) :- assert(the_originals_AND_revolution_of_dignity(Start,End)), generate_facts_the_originals_AND_revolution_of_dignity(Tail).

the_originals_AND_revolution_of_dignity_aux() :- findall((Start,End),the_originals(Start,End),Interval1), findall((Start,End),revolution_of_dignity(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_originals_AND_revolution_of_dignity(Interval).

the_originals_AND_revolution_of_dignity_at_1948(Res) :- setof((Start,End),the_originals_AND_revolution_of_dignity(Start,End),AllINtervals), checkvalidity(1948,AllINtervals,Res).

check_query() :- write('Query = the_originals_AND_revolution_of_dignity_at_1948'), (the_originals_AND_revolution_of_dignity_at_1948(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_originals_AND_revolution_of_dignity_aux().

