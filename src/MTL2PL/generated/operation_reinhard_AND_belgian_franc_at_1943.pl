:- include('database.pl').
operation_reinhard(Start,End) :- begin('operation_reinhard',_,_,Start), end('operation_reinhard',_,_,End), Start=<End.

belgian_franc(Start,End) :- begin('belgian_franc',_,_,Start), end('belgian_franc',_,_,End), Start=<End.

generate_facts_operation_reinhard_AND_belgian_franc([]) :- assert(operation_reinhard_AND_belgian_franc(-1,-1)).

generate_facts_operation_reinhard_AND_belgian_franc([(Start,End) | Tail]) :- assert(operation_reinhard_AND_belgian_franc(Start,End)), generate_facts_operation_reinhard_AND_belgian_franc(Tail).

operation_reinhard_AND_belgian_franc_aux() :- findall((Start,End),operation_reinhard(Start,End),Interval1), findall((Start,End),belgian_franc(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_operation_reinhard_AND_belgian_franc(Interval).

operation_reinhard_AND_belgian_franc_at_1943(Res) :- setof((Start,End),operation_reinhard_AND_belgian_franc(Start,End),AllINtervals), checkvalidity(1943,AllINtervals,Res).

check_query() :- write('Query = operation_reinhard_AND_belgian_franc_at_1943'), (operation_reinhard_AND_belgian_franc_at_1943(true) -> write('\nRes   = true');write('\nRes   = false')).
?- operation_reinhard_AND_belgian_franc_aux().

