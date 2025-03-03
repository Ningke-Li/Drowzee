:- include('database.pl').
misfits(Start,End) :- begin('misfits',_,_,Start), end('misfits',_,_,End), Start=<End.

finally_misfits_during_4_15(Start,End) :- misfits(Start1,End1), (Start1-15)=<(End1-4), Start is (Start1-15), End is (End1-4), Start=<End.

compare_finally_misfits_during_4_15(Dir,finally_misfits_during_4_15(Start1,_),finally_misfits_during_4_15(Start2,_)) :- Start1=<Start2.

generate_neg_finally_misfits_during_4_15([]).

generate_neg_finally_misfits_during_4_15([(Start,End) | Tail]) :- assert(neg_finally_misfits_during_4_15(Start,End)), generate_neg_finally_misfits_during_4_15(Tail).

sort_finally_misfits_during_4_15(SortedIntervals) :- findall((Start,End),finally_misfits_during_4_15(Start,End),UnsortedIntervals), predsort(compare_finally_misfits_during_4_15,UnsortedIntervals,SortedIntervals).

generate_neg_finally_misfits_during_4_15_aux() :- sort_finally_misfits_during_4_15(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_misfits_during_4_15(NegatedIntervals).

neg_finally_misfits_during_4_15_at_1923(Res) :- setof((Start,End),neg_finally_misfits_during_4_15(Start,End),AllINtervals), checkvalidity(1923,AllINtervals,Res).

check_query() :- write('Query = neg_finally_misfits_during_4_15_at_1923'), (neg_finally_misfits_during_4_15_at_1923(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_misfits_during_4_15_aux().

