:- include('database.pl').
vikings(Start,End) :- begin('vikings',_,_,Start), end('vikings',_,_,End), Start=<End.

finally_vikings_during_1_11(Start,End) :- vikings(Start1,End1), (Start1-11)=<(End1-1), Start is (Start1-11), End is (End1-1), Start=<End.

compare_finally_vikings_during_1_11(Dir,finally_vikings_during_1_11(Start1,_),finally_vikings_during_1_11(Start2,_)) :- Start1=<Start2.

generate_neg_finally_vikings_during_1_11([]).

generate_neg_finally_vikings_during_1_11([(Start,End) | Tail]) :- assert(neg_finally_vikings_during_1_11(Start,End)), generate_neg_finally_vikings_during_1_11(Tail).

sort_finally_vikings_during_1_11(SortedIntervals) :- findall((Start,End),finally_vikings_during_1_11(Start,End),UnsortedIntervals), predsort(compare_finally_vikings_during_1_11,UnsortedIntervals,SortedIntervals).

generate_neg_finally_vikings_during_1_11_aux() :- sort_finally_vikings_during_1_11(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_vikings_during_1_11(NegatedIntervals).

neg_finally_vikings_during_1_11_at_923(Res) :- setof((Start,End),neg_finally_vikings_during_1_11(Start,End),AllINtervals), checkvalidity(923,AllINtervals,Res).

check_query() :- write('Query = neg_finally_vikings_during_1_11_at_923'), (neg_finally_vikings_during_1_11_at_923(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_vikings_during_1_11_aux().

