:- include('database.pl').
castle(Start,End) :- begin('castle',_,_,Start), end('castle',_,_,End), Start=<End.

finally_castle_during_10_12(Start,End) :- castle(Start1,End1), (Start1-12)=<(End1-10), Start is (Start1-12), End is (End1-10), Start=<End.

compare_finally_castle_during_10_12(Dir,finally_castle_during_10_12(Start1,_),finally_castle_during_10_12(Start2,_)) :- Start1=<Start2.

generate_neg_finally_castle_during_10_12([]).

generate_neg_finally_castle_during_10_12([(Start,End) | Tail]) :- assert(neg_finally_castle_during_10_12(Start,End)), generate_neg_finally_castle_during_10_12(Tail).

sort_finally_castle_during_10_12(SortedIntervals) :- findall((Start,End),finally_castle_during_10_12(Start,End),UnsortedIntervals), predsort(compare_finally_castle_during_10_12,UnsortedIntervals,SortedIntervals).

generate_neg_finally_castle_during_10_12_aux() :- sort_finally_castle_during_10_12(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_castle_during_10_12(NegatedIntervals).

neg_finally_castle_during_10_12_at_2037(Res) :- setof((Start,End),neg_finally_castle_during_10_12(Start,End),AllINtervals), checkvalidity(2037,AllINtervals,Res).

check_query() :- write('Query = neg_finally_castle_during_10_12_at_2037'), (neg_finally_castle_during_10_12_at_2037(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_castle_during_10_12_aux().

