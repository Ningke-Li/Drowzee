:- include('database.pl').
first_serbian_uprising(Start,End) :- begin('first_serbian_uprising',_,_,Start), end('first_serbian_uprising',_,_,End), Start=<End.

renaissance(Start,End) :- begin('renaissance',_,_,Start), end('renaissance',_,_,End), Start=<End.

generate_facts_first_serbian_uprising_OR_renaissance([]) :- assert(first_serbian_uprising_OR_renaissance(-1,-1)).

generate_facts_first_serbian_uprising_OR_renaissance([(Start,End) | Tail]) :- assert(first_serbian_uprising_OR_renaissance(Start,End)), generate_facts_first_serbian_uprising_OR_renaissance(Tail).

first_serbian_uprising_OR_renaissance_aux() :- findall((Start,End),first_serbian_uprising(Start,End),Interval1), findall((Start,End),renaissance(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_first_serbian_uprising_OR_renaissance(Interval).

first_serbian_uprising_OR_renaissance_at_1638(Res) :- setof((Start,End),first_serbian_uprising_OR_renaissance(Start,End),AllINtervals), checkvalidity(1638,AllINtervals,Res).

check_query() :- write('Query = first_serbian_uprising_OR_renaissance_at_1638'), (first_serbian_uprising_OR_renaissance_at_1638(true) -> write('\nRes   = true');write('\nRes   = false')).
?- first_serbian_uprising_OR_renaissance_aux().

