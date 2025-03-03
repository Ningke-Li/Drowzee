:- include('database.pl').
fleabag(Start,End) :- begin('fleabag',_,_,Start), end('fleabag',_,_,End), Start=<End.

finally_fleabag_during_10_15(Start,End) :- fleabag(Start1,End1), (Start1-15)=<(End1-10), Start is (Start1-15), End is (End1-10), Start=<End.

compare_finally_fleabag_during_10_15(Dir,finally_fleabag_during_10_15(Start1,_),finally_fleabag_during_10_15(Start2,_)) :- Start1=<Start2.

generate_neg_finally_fleabag_during_10_15([]).

generate_neg_finally_fleabag_during_10_15([(Start,End) | Tail]) :- assert(neg_finally_fleabag_during_10_15(Start,End)), generate_neg_finally_fleabag_during_10_15(Tail).

sort_finally_fleabag_during_10_15(SortedIntervals) :- findall((Start,End),finally_fleabag_during_10_15(Start,End),UnsortedIntervals), predsort(compare_finally_fleabag_during_10_15,UnsortedIntervals,SortedIntervals).

generate_neg_finally_fleabag_during_10_15_aux() :- sort_finally_fleabag_during_10_15(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_fleabag_during_10_15(NegatedIntervals).

neg_finally_fleabag_during_10_15_at_1651(Res) :- setof((Start,End),neg_finally_fleabag_during_10_15(Start,End),AllINtervals), checkvalidity(1651,AllINtervals,Res).

check_query() :- write('Query = neg_finally_fleabag_during_10_15_at_1651'), (neg_finally_fleabag_during_10_15_at_1651(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_fleabag_during_10_15_aux().

