:- include('database.pl').
mannerism(Start,End) :- begin('mannerism',_,_,Start), end('mannerism',_,_,End), Start=<End.

estonian_kroon(Start,End) :- begin('estonian_kroon',_,_,Start), end('estonian_kroon',_,_,End), Start=<End.

generate_facts_mannerism_OR_estonian_kroon([]) :- assert(mannerism_OR_estonian_kroon(-1,-1)).

generate_facts_mannerism_OR_estonian_kroon([(Start,End) | Tail]) :- assert(mannerism_OR_estonian_kroon(Start,End)), generate_facts_mannerism_OR_estonian_kroon(Tail).

mannerism_OR_estonian_kroon_aux() :- findall((Start,End),mannerism(Start,End),Interval1), findall((Start,End),estonian_kroon(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_mannerism_OR_estonian_kroon(Interval).

mannerism_OR_estonian_kroon_at_1481(Res) :- setof((Start,End),mannerism_OR_estonian_kroon(Start,End),AllINtervals), checkvalidity(1481,AllINtervals,Res).

check_query() :- write('Query = mannerism_OR_estonian_kroon_at_1481'), (mannerism_OR_estonian_kroon_at_1481(true) -> write('\nRes   = true');write('\nRes   = false')).
?- mannerism_OR_estonian_kroon_aux().

