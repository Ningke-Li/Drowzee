:- include('database.pl').
fiba_eurobasket_2013(Start,End) :- begin('fiba_eurobasket_2013',_,_,Start), end('fiba_eurobasket_2013',_,_,End), Start=<End.

operation_spring_awakening(Start,End) :- begin('operation_spring_awakening',_,_,Start), end('operation_spring_awakening',_,_,End), Start=<End.

generate_facts_fiba_eurobasket_2013_OR_operation_spring_awakening([]) :- assert(fiba_eurobasket_2013_OR_operation_spring_awakening(-1,-1)).

generate_facts_fiba_eurobasket_2013_OR_operation_spring_awakening([(Start,End) | Tail]) :- assert(fiba_eurobasket_2013_OR_operation_spring_awakening(Start,End)), generate_facts_fiba_eurobasket_2013_OR_operation_spring_awakening(Tail).

fiba_eurobasket_2013_OR_operation_spring_awakening_aux() :- findall((Start,End),fiba_eurobasket_2013(Start,End),Interval1), findall((Start,End),operation_spring_awakening(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_fiba_eurobasket_2013_OR_operation_spring_awakening(Interval).

fiba_eurobasket_2013_OR_operation_spring_awakening_at_1947(Res) :- setof((Start,End),fiba_eurobasket_2013_OR_operation_spring_awakening(Start,End),AllINtervals), checkvalidity(1947,AllINtervals,Res).

check_query() :- write('Query = fiba_eurobasket_2013_OR_operation_spring_awakening_at_1947'), (fiba_eurobasket_2013_OR_operation_spring_awakening_at_1947(true) -> write('\nRes   = true');write('\nRes   = false')).
?- fiba_eurobasket_2013_OR_operation_spring_awakening_aux().

