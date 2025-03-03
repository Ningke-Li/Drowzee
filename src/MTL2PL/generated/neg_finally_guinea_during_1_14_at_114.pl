:- include('database.pl').
guinea(Start,End) :- begin('guinea',_,_,Start), end('guinea',_,_,End), Start=<End.

finally_guinea_during_1_14(Start,End) :- guinea(Start1,End1), (Start1-14)=<(End1-1), Start is (Start1-14), End is (End1-1), Start=<End.

compare_finally_guinea_during_1_14(Dir,finally_guinea_during_1_14(Start1,_),finally_guinea_during_1_14(Start2,_)) :- Start1=<Start2.

generate_neg_finally_guinea_during_1_14([]).

generate_neg_finally_guinea_during_1_14([(Start,End) | Tail]) :- assert(neg_finally_guinea_during_1_14(Start,End)), generate_neg_finally_guinea_during_1_14(Tail).

sort_finally_guinea_during_1_14(SortedIntervals) :- findall((Start,End),finally_guinea_during_1_14(Start,End),UnsortedIntervals), predsort(compare_finally_guinea_during_1_14,UnsortedIntervals,SortedIntervals).

generate_neg_finally_guinea_during_1_14_aux() :- sort_finally_guinea_during_1_14(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_guinea_during_1_14(NegatedIntervals).

neg_finally_guinea_during_1_14_at_114(Res) :- setof((Start,End),neg_finally_guinea_during_1_14(Start,End),AllINtervals), checkvalidity(114,AllINtervals,Res).

check_query() :- write('Query = neg_finally_guinea_during_1_14_at_114'), (neg_finally_guinea_during_1_14_at_114(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_guinea_during_1_14_aux().

