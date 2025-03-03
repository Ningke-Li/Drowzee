:- include('database.pl').
totally_spies_(Start,End) :- begin('totally_spies_',_,_,Start), end('totally_spies_',_,_,End), Start=<End.

finally_totally_spies__during_6_11(Start,End) :- totally_spies_(Start1,End1), (Start1-11)=<(End1-6), Start is (Start1-11), End is (End1-6), Start=<End.

compare_finally_totally_spies__during_6_11(Dir,finally_totally_spies__during_6_11(Start1,_),finally_totally_spies__during_6_11(Start2,_)) :- Start1=<Start2.

generate_neg_finally_totally_spies__during_6_11([]).

generate_neg_finally_totally_spies__during_6_11([(Start,End) | Tail]) :- assert(neg_finally_totally_spies__during_6_11(Start,End)), generate_neg_finally_totally_spies__during_6_11(Tail).

sort_finally_totally_spies__during_6_11(SortedIntervals) :- findall((Start,End),finally_totally_spies__during_6_11(Start,End),UnsortedIntervals), predsort(compare_finally_totally_spies__during_6_11,UnsortedIntervals,SortedIntervals).

generate_neg_finally_totally_spies__during_6_11_aux() :- sort_finally_totally_spies__during_6_11(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_totally_spies__during_6_11(NegatedIntervals).

neg_finally_totally_spies__during_6_11_at_1894(Res) :- setof((Start,End),neg_finally_totally_spies__during_6_11(Start,End),AllINtervals), checkvalidity(1894,AllINtervals,Res).

check_query() :- write('Query = neg_finally_totally_spies__during_6_11_at_1894'), (neg_finally_totally_spies__during_6_11_at_1894(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_totally_spies__during_6_11_aux().

