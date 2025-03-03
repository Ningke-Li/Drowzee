:- include('database.pl').
chowder(Start,End) :- begin('chowder',_,_,Start), end('chowder',_,_,End), Start=<End.

reign_of_terror(Start,End) :- begin('reign_of_terror',_,_,Start), end('reign_of_terror',_,_,End), Start=<End.

generate_facts_chowder_OR_reign_of_terror([]) :- assert(chowder_OR_reign_of_terror(-1,-1)).

generate_facts_chowder_OR_reign_of_terror([(Start,End) | Tail]) :- assert(chowder_OR_reign_of_terror(Start,End)), generate_facts_chowder_OR_reign_of_terror(Tail).

chowder_OR_reign_of_terror_aux() :- findall((Start,End),chowder(Start,End),Interval1), findall((Start,End),reign_of_terror(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_chowder_OR_reign_of_terror(Interval).

chowder_OR_reign_of_terror_at_1940(Res) :- setof((Start,End),chowder_OR_reign_of_terror(Start,End),AllINtervals), checkvalidity(1940,AllINtervals,Res).

check_query() :- write('Query = chowder_OR_reign_of_terror_at_1940'), (chowder_OR_reign_of_terror_at_1940(true) -> write('\nRes   = true');write('\nRes   = false')).
?- chowder_OR_reign_of_terror_aux().

