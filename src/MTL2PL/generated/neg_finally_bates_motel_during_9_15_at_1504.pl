:- include('database.pl').
bates_motel(Start,End) :- begin('bates_motel',_,_,Start), end('bates_motel',_,_,End), Start=<End.

finally_bates_motel_during_9_15(Start,End) :- bates_motel(Start1,End1), (Start1-15)=<(End1-9), Start is (Start1-15), End is (End1-9), Start=<End.

compare_finally_bates_motel_during_9_15(Dir,finally_bates_motel_during_9_15(Start1,_),finally_bates_motel_during_9_15(Start2,_)) :- Start1=<Start2.

generate_neg_finally_bates_motel_during_9_15([]).

generate_neg_finally_bates_motel_during_9_15([(Start,End) | Tail]) :- assert(neg_finally_bates_motel_during_9_15(Start,End)), generate_neg_finally_bates_motel_during_9_15(Tail).

sort_finally_bates_motel_during_9_15(SortedIntervals) :- findall((Start,End),finally_bates_motel_during_9_15(Start,End),UnsortedIntervals), predsort(compare_finally_bates_motel_during_9_15,UnsortedIntervals,SortedIntervals).

generate_neg_finally_bates_motel_during_9_15_aux() :- sort_finally_bates_motel_during_9_15(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_bates_motel_during_9_15(NegatedIntervals).

neg_finally_bates_motel_during_9_15_at_1504(Res) :- setof((Start,End),neg_finally_bates_motel_during_9_15(Start,End),AllINtervals), checkvalidity(1504,AllINtervals,Res).

check_query() :- write('Query = neg_finally_bates_motel_during_9_15_at_1504'), (neg_finally_bates_motel_during_9_15_at_1504(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_bates_motel_during_9_15_aux().

