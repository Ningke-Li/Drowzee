:- include('database.pl').
operation_crossroads(Start,End) :- begin('operation_crossroads',_,_,Start), end('operation_crossroads',_,_,End), Start=<End.

compare_operation_crossroads(Dir,operation_crossroads(Start1,_),operation_crossroads(Start2,_)) :- Start1=<Start2.

generate_neg_operation_crossroads([]).

generate_neg_operation_crossroads([(Start,End) | Tail]) :- assert(neg_operation_crossroads(Start,End)), generate_neg_operation_crossroads(Tail).

sort_operation_crossroads(SortedIntervals) :- findall((Start,End),operation_crossroads(Start,End),UnsortedIntervals), predsort(compare_operation_crossroads,UnsortedIntervals,SortedIntervals).

generate_neg_operation_crossroads_aux() :- sort_operation_crossroads(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_operation_crossroads(NegatedIntervals).

neg_operation_crossroads_at_1018(Res) :- setof((Start,End),neg_operation_crossroads(Start,End),AllINtervals), checkvalidity(1018,AllINtervals,Res).

check_query() :- write('Query = neg_operation_crossroads_at_1018'), (neg_operation_crossroads_at_1018(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_operation_crossroads_aux().

