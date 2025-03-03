:- include('database.pl').
second_french_empire(Start,End) :- begin('second_french_empire',_,_,Start), end('second_french_empire',_,_,End), Start=<End.

finally_second_french_empire_during_4_12(Start,End) :- second_french_empire(Start1,End1), (Start1-12)=<(End1-4), Start is (Start1-12), End is (End1-4), Start=<End.

compare_finally_second_french_empire_during_4_12(Dir,finally_second_french_empire_during_4_12(Start1,_),finally_second_french_empire_during_4_12(Start2,_)) :- Start1=<Start2.

generate_neg_finally_second_french_empire_during_4_12([]).

generate_neg_finally_second_french_empire_during_4_12([(Start,End) | Tail]) :- assert(neg_finally_second_french_empire_during_4_12(Start,End)), generate_neg_finally_second_french_empire_during_4_12(Tail).

sort_finally_second_french_empire_during_4_12(SortedIntervals) :- findall((Start,End),finally_second_french_empire_during_4_12(Start,End),UnsortedIntervals), predsort(compare_finally_second_french_empire_during_4_12,UnsortedIntervals,SortedIntervals).

generate_neg_finally_second_french_empire_during_4_12_aux() :- sort_finally_second_french_empire_during_4_12(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_second_french_empire_during_4_12(NegatedIntervals).

neg_finally_second_french_empire_during_4_12_at_1194(Res) :- setof((Start,End),neg_finally_second_french_empire_during_4_12(Start,End),AllINtervals), checkvalidity(1194,AllINtervals,Res).

check_query() :- write('Query = neg_finally_second_french_empire_during_4_12_at_1194'), (neg_finally_second_french_empire_during_4_12_at_1194(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_second_french_empire_during_4_12_aux().

