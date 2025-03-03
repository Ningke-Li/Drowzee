:- include('database.pl').
operation_compass(Start,End) :- begin('operation_compass',_,_,Start), end('operation_compass',_,_,End), Start=<End.

greek_drachma(Start,End) :- begin('greek_drachma',_,_,Start), end('greek_drachma',_,_,End), Start=<End.

generate_facts_operation_compass_AND_greek_drachma([]) :- assert(operation_compass_AND_greek_drachma(-1,-1)).

generate_facts_operation_compass_AND_greek_drachma([(Start,End) | Tail]) :- assert(operation_compass_AND_greek_drachma(Start,End)), generate_facts_operation_compass_AND_greek_drachma(Tail).

operation_compass_AND_greek_drachma_aux() :- findall((Start,End),operation_compass(Start,End),Interval1), findall((Start,End),greek_drachma(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_operation_compass_AND_greek_drachma(Interval).

operation_compass_AND_greek_drachma_at_1833(Res) :- setof((Start,End),operation_compass_AND_greek_drachma(Start,End),AllINtervals), checkvalidity(1833,AllINtervals,Res).

check_query() :- write('Query = operation_compass_AND_greek_drachma_at_1833'), (operation_compass_AND_greek_drachma_at_1833(true) -> write('\nRes   = true');write('\nRes   = false')).
?- operation_compass_AND_greek_drachma_aux().

