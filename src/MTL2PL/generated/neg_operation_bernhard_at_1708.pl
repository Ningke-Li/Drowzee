:- include('database.pl').
operation_bernhard(Start,End) :- begin('operation_bernhard',_,_,Start), end('operation_bernhard',_,_,End), Start=<End.

compare_operation_bernhard(Dir,operation_bernhard(Start1,_),operation_bernhard(Start2,_)) :- Start1=<Start2.

generate_neg_operation_bernhard([]).

generate_neg_operation_bernhard([(Start,End) | Tail]) :- assert(neg_operation_bernhard(Start,End)), generate_neg_operation_bernhard(Tail).

sort_operation_bernhard(SortedIntervals) :- findall((Start,End),operation_bernhard(Start,End),UnsortedIntervals), predsort(compare_operation_bernhard,UnsortedIntervals,SortedIntervals).

generate_neg_operation_bernhard_aux() :- sort_operation_bernhard(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_operation_bernhard(NegatedIntervals).

neg_operation_bernhard_at_1708(Res) :- setof((Start,End),neg_operation_bernhard(Start,End),AllINtervals), checkvalidity(1708,AllINtervals,Res).

check_query() :- write('Query = neg_operation_bernhard_at_1708'), (neg_operation_bernhard_at_1708(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_operation_bernhard_aux().

