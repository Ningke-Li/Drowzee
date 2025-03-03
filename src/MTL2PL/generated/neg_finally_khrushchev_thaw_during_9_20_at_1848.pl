:- include('database.pl').
khrushchev_thaw(Start,End) :- begin('khrushchev_thaw',_,_,Start), end('khrushchev_thaw',_,_,End), Start=<End.

finally_khrushchev_thaw_during_9_20(Start,End) :- khrushchev_thaw(Start1,End1), (Start1-20)=<(End1-9), Start is (Start1-20), End is (End1-9), Start=<End.

compare_finally_khrushchev_thaw_during_9_20(Dir,finally_khrushchev_thaw_during_9_20(Start1,_),finally_khrushchev_thaw_during_9_20(Start2,_)) :- Start1=<Start2.

generate_neg_finally_khrushchev_thaw_during_9_20([]).

generate_neg_finally_khrushchev_thaw_during_9_20([(Start,End) | Tail]) :- assert(neg_finally_khrushchev_thaw_during_9_20(Start,End)), generate_neg_finally_khrushchev_thaw_during_9_20(Tail).

sort_finally_khrushchev_thaw_during_9_20(SortedIntervals) :- findall((Start,End),finally_khrushchev_thaw_during_9_20(Start,End),UnsortedIntervals), predsort(compare_finally_khrushchev_thaw_during_9_20,UnsortedIntervals,SortedIntervals).

generate_neg_finally_khrushchev_thaw_during_9_20_aux() :- sort_finally_khrushchev_thaw_during_9_20(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_khrushchev_thaw_during_9_20(NegatedIntervals).

neg_finally_khrushchev_thaw_during_9_20_at_1848(Res) :- setof((Start,End),neg_finally_khrushchev_thaw_during_9_20(Start,End),AllINtervals), checkvalidity(1848,AllINtervals,Res).

check_query() :- write('Query = neg_finally_khrushchev_thaw_during_9_20_at_1848'), (neg_finally_khrushchev_thaw_during_9_20_at_1848(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_khrushchev_thaw_during_9_20_aux().

