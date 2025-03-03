:- include('database.pl').
the_americans(Start,End) :- begin('the_americans',_,_,Start), end('the_americans',_,_,End), Start=<End.

finally_the_americans_during_8_15(Start,End) :- the_americans(Start1,End1), (Start1-15)=<(End1-8), Start is (Start1-15), End is (End1-8), Start=<End.

compare_finally_the_americans_during_8_15(Dir,finally_the_americans_during_8_15(Start1,_),finally_the_americans_during_8_15(Start2,_)) :- Start1=<Start2.

generate_neg_finally_the_americans_during_8_15([]).

generate_neg_finally_the_americans_during_8_15([(Start,End) | Tail]) :- assert(neg_finally_the_americans_during_8_15(Start,End)), generate_neg_finally_the_americans_during_8_15(Tail).

sort_finally_the_americans_during_8_15(SortedIntervals) :- findall((Start,End),finally_the_americans_during_8_15(Start,End),UnsortedIntervals), predsort(compare_finally_the_americans_during_8_15,UnsortedIntervals,SortedIntervals).

generate_neg_finally_the_americans_during_8_15_aux() :- sort_finally_the_americans_during_8_15(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_the_americans_during_8_15(NegatedIntervals).

neg_finally_the_americans_during_8_15_at_462(Res) :- setof((Start,End),neg_finally_the_americans_during_8_15(Start,End),AllINtervals), checkvalidity(462,AllINtervals,Res).

check_query() :- write('Query = neg_finally_the_americans_during_8_15_at_462'), (neg_finally_the_americans_during_8_15_at_462(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_the_americans_during_8_15_aux().

