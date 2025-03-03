:- include('database.pl').
operation_paperclip(Start,End) :- begin('operation_paperclip',_,_,Start), end('operation_paperclip',_,_,End), Start=<End.

indian_independence_movement(Start,End) :- begin('indian_independence_movement',_,_,Start), end('indian_independence_movement',_,_,End), Start=<End.

generate_facts_operation_paperclip_AND_indian_independence_movement([]) :- assert(operation_paperclip_AND_indian_independence_movement(-1,-1)).

generate_facts_operation_paperclip_AND_indian_independence_movement([(Start,End) | Tail]) :- assert(operation_paperclip_AND_indian_independence_movement(Start,End)), generate_facts_operation_paperclip_AND_indian_independence_movement(Tail).

operation_paperclip_AND_indian_independence_movement_aux() :- findall((Start,End),operation_paperclip(Start,End),Interval1), findall((Start,End),indian_independence_movement(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_operation_paperclip_AND_indian_independence_movement(Interval).

operation_paperclip_AND_indian_independence_movement_at_1974(Res) :- setof((Start,End),operation_paperclip_AND_indian_independence_movement(Start,End),AllINtervals), checkvalidity(1974,AllINtervals,Res).

check_query() :- write('Query = operation_paperclip_AND_indian_independence_movement_at_1974'), (operation_paperclip_AND_indian_independence_movement_at_1974(true) -> write('\nRes   = true');write('\nRes   = false')).
?- operation_paperclip_AND_indian_independence_movement_aux().

