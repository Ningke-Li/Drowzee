:- include('database.pl').
atlanta(Start,End) :- begin('atlanta',_,_,Start), end('atlanta',_,_,End), Start=<End.

finally_atlanta_during_10_19(Start,End) :- atlanta(Start1,End1), (Start1-19)=<(End1-10), Start is (Start1-19), End is (End1-10), Start=<End.

compare_finally_atlanta_during_10_19(Dir,finally_atlanta_during_10_19(Start1,_),finally_atlanta_during_10_19(Start2,_)) :- Start1=<Start2.

generate_neg_finally_atlanta_during_10_19([]).

generate_neg_finally_atlanta_during_10_19([(Start,End) | Tail]) :- assert(neg_finally_atlanta_during_10_19(Start,End)), generate_neg_finally_atlanta_during_10_19(Tail).

sort_finally_atlanta_during_10_19(SortedIntervals) :- findall((Start,End),finally_atlanta_during_10_19(Start,End),UnsortedIntervals), predsort(compare_finally_atlanta_during_10_19,UnsortedIntervals,SortedIntervals).

generate_neg_finally_atlanta_during_10_19_aux() :- sort_finally_atlanta_during_10_19(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_atlanta_during_10_19(NegatedIntervals).

neg_finally_atlanta_during_10_19_at_1957(Res) :- setof((Start,End),neg_finally_atlanta_during_10_19(Start,End),AllINtervals), checkvalidity(1957,AllINtervals,Res).

check_query() :- write('Query = neg_finally_atlanta_during_10_19_at_1957'), (neg_finally_atlanta_during_10_19_at_1957(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_atlanta_during_10_19_aux().

