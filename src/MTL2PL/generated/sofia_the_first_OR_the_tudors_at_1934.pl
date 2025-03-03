:- include('database.pl').
sofia_the_first(Start,End) :- begin('sofia_the_first',_,_,Start), end('sofia_the_first',_,_,End), Start=<End.

the_tudors(Start,End) :- begin('the_tudors',_,_,Start), end('the_tudors',_,_,End), Start=<End.

generate_facts_sofia_the_first_OR_the_tudors([]) :- assert(sofia_the_first_OR_the_tudors(-1,-1)).

generate_facts_sofia_the_first_OR_the_tudors([(Start,End) | Tail]) :- assert(sofia_the_first_OR_the_tudors(Start,End)), generate_facts_sofia_the_first_OR_the_tudors(Tail).

sofia_the_first_OR_the_tudors_aux() :- findall((Start,End),sofia_the_first(Start,End),Interval1), findall((Start,End),the_tudors(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_sofia_the_first_OR_the_tudors(Interval).

sofia_the_first_OR_the_tudors_at_1934(Res) :- setof((Start,End),sofia_the_first_OR_the_tudors(Start,End),AllINtervals), checkvalidity(1934,AllINtervals,Res).

check_query() :- write('Query = sofia_the_first_OR_the_tudors_at_1934'), (sofia_the_first_OR_the_tudors_at_1934(true) -> write('\nRes   = true');write('\nRes   = false')).
?- sofia_the_first_OR_the_tudors_aux().

