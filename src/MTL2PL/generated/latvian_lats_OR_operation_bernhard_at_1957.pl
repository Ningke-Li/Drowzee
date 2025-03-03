:- include('database.pl').
latvian_lats(Start,End) :- begin('latvian_lats',_,_,Start), end('latvian_lats',_,_,End), Start=<End.

operation_bernhard(Start,End) :- begin('operation_bernhard',_,_,Start), end('operation_bernhard',_,_,End), Start=<End.

generate_facts_latvian_lats_OR_operation_bernhard([]) :- assert(latvian_lats_OR_operation_bernhard(-1,-1)).

generate_facts_latvian_lats_OR_operation_bernhard([(Start,End) | Tail]) :- assert(latvian_lats_OR_operation_bernhard(Start,End)), generate_facts_latvian_lats_OR_operation_bernhard(Tail).

latvian_lats_OR_operation_bernhard_aux() :- findall((Start,End),latvian_lats(Start,End),Interval1), findall((Start,End),operation_bernhard(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_latvian_lats_OR_operation_bernhard(Interval).

latvian_lats_OR_operation_bernhard_at_1957(Res) :- setof((Start,End),latvian_lats_OR_operation_bernhard(Start,End),AllINtervals), checkvalidity(1957,AllINtervals,Res).

check_query() :- write('Query = latvian_lats_OR_operation_bernhard_at_1957'), (latvian_lats_OR_operation_bernhard_at_1957(true) -> write('\nRes   = true');write('\nRes   = false')).
?- latvian_lats_OR_operation_bernhard_aux().

