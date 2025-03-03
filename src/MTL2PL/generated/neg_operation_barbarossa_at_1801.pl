:- include('database.pl').
operation_barbarossa(Start,End) :- begin('operation_barbarossa',_,_,Start), end('operation_barbarossa',_,_,End), Start=<End.

compare_operation_barbarossa(Dir,operation_barbarossa(Start1,_),operation_barbarossa(Start2,_)) :- Start1=<Start2.

generate_neg_operation_barbarossa([]).

generate_neg_operation_barbarossa([(Start,End) | Tail]) :- assert(neg_operation_barbarossa(Start,End)), generate_neg_operation_barbarossa(Tail).

sort_operation_barbarossa(SortedIntervals) :- findall((Start,End),operation_barbarossa(Start,End),UnsortedIntervals), predsort(compare_operation_barbarossa,UnsortedIntervals,SortedIntervals).

generate_neg_operation_barbarossa_aux() :- sort_operation_barbarossa(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_operation_barbarossa(NegatedIntervals).

neg_operation_barbarossa_at_1801(Res) :- setof((Start,End),neg_operation_barbarossa(Start,End),AllINtervals), checkvalidity(1801,AllINtervals,Res).

check_query() :- write('Query = neg_operation_barbarossa_at_1801'), (neg_operation_barbarossa_at_1801(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_operation_barbarossa_aux().

