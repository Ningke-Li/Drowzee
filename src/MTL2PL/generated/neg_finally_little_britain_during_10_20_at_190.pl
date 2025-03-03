:- include('database.pl').
little_britain(Start,End) :- begin('little_britain',_,_,Start), end('little_britain',_,_,End), Start=<End.

finally_little_britain_during_10_20(Start,End) :- little_britain(Start1,End1), (Start1-20)=<(End1-10), Start is (Start1-20), End is (End1-10), Start=<End.

compare_finally_little_britain_during_10_20(Dir,finally_little_britain_during_10_20(Start1,_),finally_little_britain_during_10_20(Start2,_)) :- Start1=<Start2.

generate_neg_finally_little_britain_during_10_20([]).

generate_neg_finally_little_britain_during_10_20([(Start,End) | Tail]) :- assert(neg_finally_little_britain_during_10_20(Start,End)), generate_neg_finally_little_britain_during_10_20(Tail).

sort_finally_little_britain_during_10_20(SortedIntervals) :- findall((Start,End),finally_little_britain_during_10_20(Start,End),UnsortedIntervals), predsort(compare_finally_little_britain_during_10_20,UnsortedIntervals,SortedIntervals).

generate_neg_finally_little_britain_during_10_20_aux() :- sort_finally_little_britain_during_10_20(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_little_britain_during_10_20(NegatedIntervals).

neg_finally_little_britain_during_10_20_at_190(Res) :- setof((Start,End),neg_finally_little_britain_during_10_20(Start,End),AllINtervals), checkvalidity(190,AllINtervals,Res).

check_query() :- write('Query = neg_finally_little_britain_during_10_20_at_190'), (neg_finally_little_britain_during_10_20_at_190(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_little_britain_during_10_20_aux().

