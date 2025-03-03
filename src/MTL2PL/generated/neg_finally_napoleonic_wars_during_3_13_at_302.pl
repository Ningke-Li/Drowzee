:- include('database.pl').
napoleonic_wars(Start,End) :- begin('napoleonic_wars',_,_,Start), end('napoleonic_wars',_,_,End), Start=<End.

finally_napoleonic_wars_during_3_13(Start,End) :- napoleonic_wars(Start1,End1), (Start1-13)=<(End1-3), Start is (Start1-13), End is (End1-3), Start=<End.

compare_finally_napoleonic_wars_during_3_13(Dir,finally_napoleonic_wars_during_3_13(Start1,_),finally_napoleonic_wars_during_3_13(Start2,_)) :- Start1=<Start2.

generate_neg_finally_napoleonic_wars_during_3_13([]).

generate_neg_finally_napoleonic_wars_during_3_13([(Start,End) | Tail]) :- assert(neg_finally_napoleonic_wars_during_3_13(Start,End)), generate_neg_finally_napoleonic_wars_during_3_13(Tail).

sort_finally_napoleonic_wars_during_3_13(SortedIntervals) :- findall((Start,End),finally_napoleonic_wars_during_3_13(Start,End),UnsortedIntervals), predsort(compare_finally_napoleonic_wars_during_3_13,UnsortedIntervals,SortedIntervals).

generate_neg_finally_napoleonic_wars_during_3_13_aux() :- sort_finally_napoleonic_wars_during_3_13(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_napoleonic_wars_during_3_13(NegatedIntervals).

neg_finally_napoleonic_wars_during_3_13_at_302(Res) :- setof((Start,End),neg_finally_napoleonic_wars_during_3_13(Start,End),AllINtervals), checkvalidity(302,AllINtervals,Res).

check_query() :- write('Query = neg_finally_napoleonic_wars_during_3_13_at_302'), (neg_finally_napoleonic_wars_during_3_13_at_302(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_napoleonic_wars_during_3_13_aux().

