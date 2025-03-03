:- include('database.pl').
the_mentalist(Start,End) :- begin('the_mentalist',_,_,Start), end('the_mentalist',_,_,End), Start=<End.

shameless(Start,End) :- begin('shameless',_,_,Start), end('shameless',_,_,End), Start=<End.

generate_facts_the_mentalist_AND_shameless([]) :- assert(the_mentalist_AND_shameless(-1,-1)).

generate_facts_the_mentalist_AND_shameless([(Start,End) | Tail]) :- assert(the_mentalist_AND_shameless(Start,End)), generate_facts_the_mentalist_AND_shameless(Tail).

the_mentalist_AND_shameless_aux() :- findall((Start,End),the_mentalist(Start,End),Interval1), findall((Start,End),shameless(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_mentalist_AND_shameless(Interval).

the_mentalist_AND_shameless_at_2013(Res) :- setof((Start,End),the_mentalist_AND_shameless(Start,End),AllINtervals), checkvalidity(2013,AllINtervals,Res).

check_query() :- write('Query = the_mentalist_AND_shameless_at_2013'), (the_mentalist_AND_shameless_at_2013(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_mentalist_AND_shameless_aux().

