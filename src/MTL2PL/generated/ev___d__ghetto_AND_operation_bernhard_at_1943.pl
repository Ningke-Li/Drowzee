:- include('database.pl').
ev___d__ghetto(Start,End) :- begin('ev___d__ghetto',_,_,Start), end('ev___d__ghetto',_,_,End), Start=<End.

operation_bernhard(Start,End) :- begin('operation_bernhard',_,_,Start), end('operation_bernhard',_,_,End), Start=<End.

generate_facts_ev___d__ghetto_AND_operation_bernhard([]) :- assert(ev___d__ghetto_AND_operation_bernhard(-1,-1)).

generate_facts_ev___d__ghetto_AND_operation_bernhard([(Start,End) | Tail]) :- assert(ev___d__ghetto_AND_operation_bernhard(Start,End)), generate_facts_ev___d__ghetto_AND_operation_bernhard(Tail).

ev___d__ghetto_AND_operation_bernhard_aux() :- findall((Start,End),ev___d__ghetto(Start,End),Interval1), findall((Start,End),operation_bernhard(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev___d__ghetto_AND_operation_bernhard(Interval).

ev___d__ghetto_AND_operation_bernhard_at_1943(Res) :- setof((Start,End),ev___d__ghetto_AND_operation_bernhard(Start,End),AllINtervals), checkvalidity(1943,AllINtervals,Res).

check_query() :- write('Query = ev___d__ghetto_AND_operation_bernhard_at_1943'), (ev___d__ghetto_AND_operation_bernhard_at_1943(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev___d__ghetto_AND_operation_bernhard_aux().

