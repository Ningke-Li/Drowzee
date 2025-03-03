:- include('database.pl').
shameless(Start,End) :- begin('shameless',_,_,Start), end('shameless',_,_,End), Start=<End.

the_originals(Start,End) :- begin('the_originals',_,_,Start), end('the_originals',_,_,End), Start=<End.

generate_facts_shameless_AND_the_originals([]) :- assert(shameless_AND_the_originals(-1,-1)).

generate_facts_shameless_AND_the_originals([(Start,End) | Tail]) :- assert(shameless_AND_the_originals(Start,End)), generate_facts_shameless_AND_the_originals(Tail).

shameless_AND_the_originals_aux() :- findall((Start,End),shameless(Start,End),Interval1), findall((Start,End),the_originals(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_shameless_AND_the_originals(Interval).

shameless_AND_the_originals_at_2040(Res) :- setof((Start,End),shameless_AND_the_originals(Start,End),AllINtervals), checkvalidity(2040,AllINtervals,Res).

check_query() :- write('Query = shameless_AND_the_originals_at_2040'), (shameless_AND_the_originals_at_2040(true) -> write('\nRes   = true');write('\nRes   = false')).
?- shameless_AND_the_originals_aux().

