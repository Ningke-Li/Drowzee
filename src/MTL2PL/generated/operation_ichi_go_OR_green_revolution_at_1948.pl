:- include('database.pl').
operation_ichi_go(Start,End) :- begin('operation_ichi_go',_,_,Start), end('operation_ichi_go',_,_,End), Start=<End.

green_revolution(Start,End) :- begin('green_revolution',_,_,Start), end('green_revolution',_,_,End), Start=<End.

generate_facts_operation_ichi_go_OR_green_revolution([]) :- assert(operation_ichi_go_OR_green_revolution(-1,-1)).

generate_facts_operation_ichi_go_OR_green_revolution([(Start,End) | Tail]) :- assert(operation_ichi_go_OR_green_revolution(Start,End)), generate_facts_operation_ichi_go_OR_green_revolution(Tail).

operation_ichi_go_OR_green_revolution_aux() :- findall((Start,End),operation_ichi_go(Start,End),Interval1), findall((Start,End),green_revolution(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_operation_ichi_go_OR_green_revolution(Interval).

operation_ichi_go_OR_green_revolution_at_1948(Res) :- setof((Start,End),operation_ichi_go_OR_green_revolution(Start,End),AllINtervals), checkvalidity(1948,AllINtervals,Res).

check_query() :- write('Query = operation_ichi_go_OR_green_revolution_at_1948'), (operation_ichi_go_OR_green_revolution_at_1948(true) -> write('\nRes   = true');write('\nRes   = false')).
?- operation_ichi_go_OR_green_revolution_aux().

