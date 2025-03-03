:- include('database.pl').
operation_bernhard(Start,End) :- begin('operation_bernhard',_,_,Start), end('operation_bernhard',_,_,End), Start=<End.

ev___d__ghetto(Start,End) :- begin('ev___d__ghetto',_,_,Start), end('ev___d__ghetto',_,_,End), Start=<End.

generate_facts_operation_bernhard_AND_ev___d__ghetto([]) :- assert(operation_bernhard_AND_ev___d__ghetto(-1,-1)).

generate_facts_operation_bernhard_AND_ev___d__ghetto([(Start,End) | Tail]) :- assert(operation_bernhard_AND_ev___d__ghetto(Start,End)), generate_facts_operation_bernhard_AND_ev___d__ghetto(Tail).

operation_bernhard_AND_ev___d__ghetto_aux() :- findall((Start,End),operation_bernhard(Start,End),Interval1), findall((Start,End),ev___d__ghetto(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_operation_bernhard_AND_ev___d__ghetto(Interval).

operation_bernhard_AND_ev___d__ghetto_at_1883(Res) :- setof((Start,End),operation_bernhard_AND_ev___d__ghetto(Start,End),AllINtervals), checkvalidity(1883,AllINtervals,Res).

check_query() :- write('Query = operation_bernhard_AND_ev___d__ghetto_at_1883'), (operation_bernhard_AND_ev___d__ghetto_at_1883(true) -> write('\nRes   = true');write('\nRes   = false')).
?- operation_bernhard_AND_ev___d__ghetto_aux().

