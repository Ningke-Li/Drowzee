:- include('database.pl').
dreyfus_affair(Start,End) :- begin('dreyfus_affair',_,_,Start), end('dreyfus_affair',_,_,End), Start=<End.

finally_dreyfus_affair_during_3_11(Start,End) :- dreyfus_affair(Start1,End1), (Start1-11)=<(End1-3), Start is (Start1-11), End is (End1-3), Start=<End.

compare_finally_dreyfus_affair_during_3_11(Dir,finally_dreyfus_affair_during_3_11(Start1,_),finally_dreyfus_affair_during_3_11(Start2,_)) :- Start1=<Start2.

generate_neg_finally_dreyfus_affair_during_3_11([]).

generate_neg_finally_dreyfus_affair_during_3_11([(Start,End) | Tail]) :- assert(neg_finally_dreyfus_affair_during_3_11(Start,End)), generate_neg_finally_dreyfus_affair_during_3_11(Tail).

sort_finally_dreyfus_affair_during_3_11(SortedIntervals) :- findall((Start,End),finally_dreyfus_affair_during_3_11(Start,End),UnsortedIntervals), predsort(compare_finally_dreyfus_affair_during_3_11,UnsortedIntervals,SortedIntervals).

generate_neg_finally_dreyfus_affair_during_3_11_aux() :- sort_finally_dreyfus_affair_during_3_11(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_dreyfus_affair_during_3_11(NegatedIntervals).

neg_finally_dreyfus_affair_during_3_11_at_1778(Res) :- setof((Start,End),neg_finally_dreyfus_affair_during_3_11(Start,End),AllINtervals), checkvalidity(1778,AllINtervals,Res).

check_query() :- write('Query = neg_finally_dreyfus_affair_during_3_11_at_1778'), (neg_finally_dreyfus_affair_during_3_11_at_1778(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_dreyfus_affair_during_3_11_aux().

