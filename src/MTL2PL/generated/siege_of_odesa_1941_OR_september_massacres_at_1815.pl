:- include('database.pl').
siege_of_odesa_1941(Start,End) :- begin('siege_of_odesa_1941',_,_,Start), end('siege_of_odesa_1941',_,_,End), Start=<End.

september_massacres(Start,End) :- begin('september_massacres',_,_,Start), end('september_massacres',_,_,End), Start=<End.

generate_facts_siege_of_odesa_1941_OR_september_massacres([]) :- assert(siege_of_odesa_1941_OR_september_massacres(-1,-1)).

generate_facts_siege_of_odesa_1941_OR_september_massacres([(Start,End) | Tail]) :- assert(siege_of_odesa_1941_OR_september_massacres(Start,End)), generate_facts_siege_of_odesa_1941_OR_september_massacres(Tail).

siege_of_odesa_1941_OR_september_massacres_aux() :- findall((Start,End),siege_of_odesa_1941(Start,End),Interval1), findall((Start,End),september_massacres(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_siege_of_odesa_1941_OR_september_massacres(Interval).

siege_of_odesa_1941_OR_september_massacres_at_1815(Res) :- setof((Start,End),siege_of_odesa_1941_OR_september_massacres(Start,End),AllINtervals), checkvalidity(1815,AllINtervals,Res).

check_query() :- write('Query = siege_of_odesa_1941_OR_september_massacres_at_1815'), (siege_of_odesa_1941_OR_september_massacres_at_1815(true) -> write('\nRes   = true');write('\nRes   = false')).
?- siege_of_odesa_1941_OR_september_massacres_aux().

