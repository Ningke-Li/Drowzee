:- include('database.pl').
soviet_invasion_of_manchuria(Start,End) :- begin('soviet_invasion_of_manchuria',_,_,Start), end('soviet_invasion_of_manchuria',_,_,End), Start=<End.

operation_crusader(Start,End) :- begin('operation_crusader',_,_,Start), end('operation_crusader',_,_,End), Start=<End.

generate_facts_soviet_invasion_of_manchuria_OR_operation_crusader([]) :- assert(soviet_invasion_of_manchuria_OR_operation_crusader(-1,-1)).

generate_facts_soviet_invasion_of_manchuria_OR_operation_crusader([(Start,End) | Tail]) :- assert(soviet_invasion_of_manchuria_OR_operation_crusader(Start,End)), generate_facts_soviet_invasion_of_manchuria_OR_operation_crusader(Tail).

soviet_invasion_of_manchuria_OR_operation_crusader_aux() :- findall((Start,End),soviet_invasion_of_manchuria(Start,End),Interval1), findall((Start,End),operation_crusader(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_soviet_invasion_of_manchuria_OR_operation_crusader(Interval).

soviet_invasion_of_manchuria_OR_operation_crusader_at_1923(Res) :- setof((Start,End),soviet_invasion_of_manchuria_OR_operation_crusader(Start,End),AllINtervals), checkvalidity(1923,AllINtervals,Res).

check_query() :- write('Query = soviet_invasion_of_manchuria_OR_operation_crusader_at_1923'), (soviet_invasion_of_manchuria_OR_operation_crusader_at_1923(true) -> write('\nRes   = true');write('\nRes   = false')).
?- soviet_invasion_of_manchuria_OR_operation_crusader_aux().

