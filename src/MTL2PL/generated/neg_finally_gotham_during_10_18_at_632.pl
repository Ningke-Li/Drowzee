:- include('database.pl').
gotham(Start,End) :- begin('gotham',_,_,Start), end('gotham',_,_,End), Start=<End.

finally_gotham_during_10_18(Start,End) :- gotham(Start1,End1), (Start1-18)=<(End1-10), Start is (Start1-18), End is (End1-10), Start=<End.

compare_finally_gotham_during_10_18(Dir,finally_gotham_during_10_18(Start1,_),finally_gotham_during_10_18(Start2,_)) :- Start1=<Start2.

generate_neg_finally_gotham_during_10_18([]).

generate_neg_finally_gotham_during_10_18([(Start,End) | Tail]) :- assert(neg_finally_gotham_during_10_18(Start,End)), generate_neg_finally_gotham_during_10_18(Tail).

sort_finally_gotham_during_10_18(SortedIntervals) :- findall((Start,End),finally_gotham_during_10_18(Start,End),UnsortedIntervals), predsort(compare_finally_gotham_during_10_18,UnsortedIntervals,SortedIntervals).

generate_neg_finally_gotham_during_10_18_aux() :- sort_finally_gotham_during_10_18(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_gotham_during_10_18(NegatedIntervals).

neg_finally_gotham_during_10_18_at_632(Res) :- setof((Start,End),neg_finally_gotham_during_10_18(Start,End),AllINtervals), checkvalidity(632,AllINtervals,Res).

check_query() :- write('Query = neg_finally_gotham_during_10_18_at_632'), (neg_finally_gotham_during_10_18_at_632(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_gotham_during_10_18_aux().

