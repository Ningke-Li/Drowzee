:- include('database.pl').
operation_compass(Start,End) :- begin('operation_compass',_,_,Start), end('operation_compass',_,_,End), Start=<End.

compare_operation_compass(Dir,operation_compass(Start1,_),operation_compass(Start2,_)) :- Start1=<Start2.

generate_neg_operation_compass([]).

generate_neg_operation_compass([(Start,End) | Tail]) :- assert(neg_operation_compass(Start,End)), generate_neg_operation_compass(Tail).

sort_operation_compass(SortedIntervals) :- findall((Start,End),operation_compass(Start,End),UnsortedIntervals), predsort(compare_operation_compass,UnsortedIntervals,SortedIntervals).

generate_neg_operation_compass_aux() :- sort_operation_compass(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_operation_compass(NegatedIntervals).

neg_operation_compass_at_1942(Res) :- setof((Start,End),neg_operation_compass(Start,End),AllINtervals), checkvalidity(1942,AllINtervals,Res).

check_query() :- write('Query = neg_operation_compass_at_1942'), (neg_operation_compass_at_1942(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_operation_compass_aux().

