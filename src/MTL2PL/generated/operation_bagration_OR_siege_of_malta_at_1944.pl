:- include('database.pl').
operation_bagration(Start,End) :- begin('operation_bagration',_,_,Start), end('operation_bagration',_,_,End), Start=<End.

siege_of_malta(Start,End) :- begin('siege_of_malta',_,_,Start), end('siege_of_malta',_,_,End), Start=<End.

generate_facts_operation_bagration_OR_siege_of_malta([]) :- assert(operation_bagration_OR_siege_of_malta(-1,-1)).

generate_facts_operation_bagration_OR_siege_of_malta([(Start,End) | Tail]) :- assert(operation_bagration_OR_siege_of_malta(Start,End)), generate_facts_operation_bagration_OR_siege_of_malta(Tail).

operation_bagration_OR_siege_of_malta_aux() :- findall((Start,End),operation_bagration(Start,End),Interval1), findall((Start,End),siege_of_malta(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_operation_bagration_OR_siege_of_malta(Interval).

operation_bagration_OR_siege_of_malta_at_1944(Res) :- setof((Start,End),operation_bagration_OR_siege_of_malta(Start,End),AllINtervals), checkvalidity(1944,AllINtervals,Res).

check_query() :- write('Query = operation_bagration_OR_siege_of_malta_at_1944'), (operation_bagration_OR_siege_of_malta_at_1944(true) -> write('\nRes   = true');write('\nRes   = false')).
?- operation_bagration_OR_siege_of_malta_aux().

