:- include('database.pl').
renaissance(Start,End) :- begin('renaissance',_,_,Start), end('renaissance',_,_,End), Start=<End.

finally_renaissance_during_5_15(Start,End) :- renaissance(Start1,End1), (Start1-15)=<(End1-5), Start is (Start1-15), End is (End1-5), Start=<End.

compare_finally_renaissance_during_5_15(Dir,finally_renaissance_during_5_15(Start1,_),finally_renaissance_during_5_15(Start2,_)) :- Start1=<Start2.

generate_neg_finally_renaissance_during_5_15([]).

generate_neg_finally_renaissance_during_5_15([(Start,End) | Tail]) :- assert(neg_finally_renaissance_during_5_15(Start,End)), generate_neg_finally_renaissance_during_5_15(Tail).

sort_finally_renaissance_during_5_15(SortedIntervals) :- findall((Start,End),finally_renaissance_during_5_15(Start,End),UnsortedIntervals), predsort(compare_finally_renaissance_during_5_15,UnsortedIntervals,SortedIntervals).

generate_neg_finally_renaissance_during_5_15_aux() :- sort_finally_renaissance_during_5_15(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_renaissance_during_5_15(NegatedIntervals).

neg_finally_renaissance_during_5_15_at_1858(Res) :- setof((Start,End),neg_finally_renaissance_during_5_15(Start,End),AllINtervals), checkvalidity(1858,AllINtervals,Res).

check_query() :- write('Query = neg_finally_renaissance_during_5_15_at_1858'), (neg_finally_renaissance_during_5_15_at_1858(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_renaissance_during_5_15_aux().

