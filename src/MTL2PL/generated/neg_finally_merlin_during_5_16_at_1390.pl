:- include('database.pl').
merlin(Start,End) :- begin('merlin',_,_,Start), end('merlin',_,_,End), Start=<End.

finally_merlin_during_5_16(Start,End) :- merlin(Start1,End1), (Start1-16)=<(End1-5), Start is (Start1-16), End is (End1-5), Start=<End.

compare_finally_merlin_during_5_16(Dir,finally_merlin_during_5_16(Start1,_),finally_merlin_during_5_16(Start2,_)) :- Start1=<Start2.

generate_neg_finally_merlin_during_5_16([]).

generate_neg_finally_merlin_during_5_16([(Start,End) | Tail]) :- assert(neg_finally_merlin_during_5_16(Start,End)), generate_neg_finally_merlin_during_5_16(Tail).

sort_finally_merlin_during_5_16(SortedIntervals) :- findall((Start,End),finally_merlin_during_5_16(Start,End),UnsortedIntervals), predsort(compare_finally_merlin_during_5_16,UnsortedIntervals,SortedIntervals).

generate_neg_finally_merlin_during_5_16_aux() :- sort_finally_merlin_during_5_16(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_merlin_during_5_16(NegatedIntervals).

neg_finally_merlin_during_5_16_at_1390(Res) :- setof((Start,End),neg_finally_merlin_during_5_16(Start,End),AllINtervals), checkvalidity(1390,AllINtervals,Res).

check_query() :- write('Query = neg_finally_merlin_during_5_16_at_1390'), (neg_finally_merlin_during_5_16_at_1390(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_merlin_during_5_16_aux().

