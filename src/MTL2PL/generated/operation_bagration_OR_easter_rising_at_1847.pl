:- include('database.pl').
operation_bagration(Start,End) :- begin('operation_bagration',_,_,Start), end('operation_bagration',_,_,End), Start=<End.

easter_rising(Start,End) :- begin('easter_rising',_,_,Start), end('easter_rising',_,_,End), Start=<End.

generate_facts_operation_bagration_OR_easter_rising([]) :- assert(operation_bagration_OR_easter_rising(-1,-1)).

generate_facts_operation_bagration_OR_easter_rising([(Start,End) | Tail]) :- assert(operation_bagration_OR_easter_rising(Start,End)), generate_facts_operation_bagration_OR_easter_rising(Tail).

operation_bagration_OR_easter_rising_aux() :- findall((Start,End),operation_bagration(Start,End),Interval1), findall((Start,End),easter_rising(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_operation_bagration_OR_easter_rising(Interval).

operation_bagration_OR_easter_rising_at_1847(Res) :- setof((Start,End),operation_bagration_OR_easter_rising(Start,End),AllINtervals), checkvalidity(1847,AllINtervals,Res).

check_query() :- write('Query = operation_bagration_OR_easter_rising_at_1847'), (operation_bagration_OR_easter_rising_at_1847(true) -> write('\nRes   = true');write('\nRes   = false')).
?- operation_bagration_OR_easter_rising_aux().

