:- include('database.pl').
numbers(Start,End) :- begin('numbers',_,_,Start), end('numbers',_,_,End), Start=<End.

finally_numbers_during_1_18(Start,End) :- numbers(Start1,End1), (Start1-18)=<(End1-1), Start is (Start1-18), End is (End1-1), Start=<End.

compare_finally_numbers_during_1_18(Dir,finally_numbers_during_1_18(Start1,_),finally_numbers_during_1_18(Start2,_)) :- Start1=<Start2.

generate_neg_finally_numbers_during_1_18([]).

generate_neg_finally_numbers_during_1_18([(Start,End) | Tail]) :- assert(neg_finally_numbers_during_1_18(Start,End)), generate_neg_finally_numbers_during_1_18(Tail).

sort_finally_numbers_during_1_18(SortedIntervals) :- findall((Start,End),finally_numbers_during_1_18(Start,End),UnsortedIntervals), predsort(compare_finally_numbers_during_1_18,UnsortedIntervals,SortedIntervals).

generate_neg_finally_numbers_during_1_18_aux() :- sort_finally_numbers_during_1_18(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_numbers_during_1_18(NegatedIntervals).

neg_finally_numbers_during_1_18_at_1963(Res) :- setof((Start,End),neg_finally_numbers_during_1_18(Start,End),AllINtervals), checkvalidity(1963,AllINtervals,Res).

check_query() :- write('Query = neg_finally_numbers_during_1_18_at_1963'), (neg_finally_numbers_during_1_18_at_1963(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_numbers_during_1_18_aux().

