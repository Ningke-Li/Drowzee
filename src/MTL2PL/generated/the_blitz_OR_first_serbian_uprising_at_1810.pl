:- include('database.pl').
the_blitz(Start,End) :- begin('the_blitz',_,_,Start), end('the_blitz',_,_,End), Start=<End.

first_serbian_uprising(Start,End) :- begin('first_serbian_uprising',_,_,Start), end('first_serbian_uprising',_,_,End), Start=<End.

generate_facts_the_blitz_OR_first_serbian_uprising([]) :- assert(the_blitz_OR_first_serbian_uprising(-1,-1)).

generate_facts_the_blitz_OR_first_serbian_uprising([(Start,End) | Tail]) :- assert(the_blitz_OR_first_serbian_uprising(Start,End)), generate_facts_the_blitz_OR_first_serbian_uprising(Tail).

the_blitz_OR_first_serbian_uprising_aux() :- findall((Start,End),the_blitz(Start,End),Interval1), findall((Start,End),first_serbian_uprising(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_the_blitz_OR_first_serbian_uprising(Interval).

the_blitz_OR_first_serbian_uprising_at_1810(Res) :- setof((Start,End),the_blitz_OR_first_serbian_uprising(Start,End),AllINtervals), checkvalidity(1810,AllINtervals,Res).

check_query() :- write('Query = the_blitz_OR_first_serbian_uprising_at_1810'), (the_blitz_OR_first_serbian_uprising_at_1810(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_blitz_OR_first_serbian_uprising_aux().

