:- include('database.pl').
homeland(Start,End) :- begin('homeland',_,_,Start), end('homeland',_,_,End), Start=<End.

the_mentalist(Start,End) :- begin('the_mentalist',_,_,Start), end('the_mentalist',_,_,End), Start=<End.

generate_facts_homeland_AND_the_mentalist([]) :- assert(homeland_AND_the_mentalist(-1,-1)).

generate_facts_homeland_AND_the_mentalist([(Start,End) | Tail]) :- assert(homeland_AND_the_mentalist(Start,End)), generate_facts_homeland_AND_the_mentalist(Tail).

homeland_AND_the_mentalist_aux() :- findall((Start,End),homeland(Start,End),Interval1), findall((Start,End),the_mentalist(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_homeland_AND_the_mentalist(Interval).

homeland_AND_the_mentalist_at_1969(Res) :- setof((Start,End),homeland_AND_the_mentalist(Start,End),AllINtervals), checkvalidity(1969,AllINtervals,Res).

check_query() :- write('Query = homeland_AND_the_mentalist_at_1969'), (homeland_AND_the_mentalist_at_1969(true) -> write('\nRes   = true');write('\nRes   = false')).
?- homeland_AND_the_mentalist_aux().

