:- include('database.pl').
operation_bernhard(Start,End) :- begin('operation_bernhard',_,_,Start), end('operation_bernhard',_,_,End), Start=<End.

world_war_ii(Start,End) :- begin('world_war_ii',_,_,Start), end('world_war_ii',_,_,End), Start=<End.

generate_facts_operation_bernhard_OR_world_war_ii([]) :- assert(operation_bernhard_OR_world_war_ii(-1,-1)).

generate_facts_operation_bernhard_OR_world_war_ii([(Start,End) | Tail]) :- assert(operation_bernhard_OR_world_war_ii(Start,End)), generate_facts_operation_bernhard_OR_world_war_ii(Tail).

operation_bernhard_OR_world_war_ii_aux() :- findall((Start,End),operation_bernhard(Start,End),Interval1), findall((Start,End),world_war_ii(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_operation_bernhard_OR_world_war_ii(Interval).

operation_bernhard_OR_world_war_ii_at_1939(Res) :- setof((Start,End),operation_bernhard_OR_world_war_ii(Start,End),AllINtervals), checkvalidity(1939,AllINtervals,Res).

check_query() :- write('Query = operation_bernhard_OR_world_war_ii_at_1939'), (operation_bernhard_OR_world_war_ii_at_1939(true) -> write('\nRes   = true');write('\nRes   = false')).
?- operation_bernhard_OR_world_war_ii_aux().

