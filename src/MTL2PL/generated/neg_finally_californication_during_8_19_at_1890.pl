:- include('database.pl').
californication(Start,End) :- begin('californication',_,_,Start), end('californication',_,_,End), Start=<End.

finally_californication_during_8_19(Start,End) :- californication(Start1,End1), (Start1-19)=<(End1-8), Start is (Start1-19), End is (End1-8), Start=<End.

compare_finally_californication_during_8_19(Dir,finally_californication_during_8_19(Start1,_),finally_californication_during_8_19(Start2,_)) :- Start1=<Start2.

generate_neg_finally_californication_during_8_19([]).

generate_neg_finally_californication_during_8_19([(Start,End) | Tail]) :- assert(neg_finally_californication_during_8_19(Start,End)), generate_neg_finally_californication_during_8_19(Tail).

sort_finally_californication_during_8_19(SortedIntervals) :- findall((Start,End),finally_californication_during_8_19(Start,End),UnsortedIntervals), predsort(compare_finally_californication_during_8_19,UnsortedIntervals,SortedIntervals).

generate_neg_finally_californication_during_8_19_aux() :- sort_finally_californication_during_8_19(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_californication_during_8_19(NegatedIntervals).

neg_finally_californication_during_8_19_at_1890(Res) :- setof((Start,End),neg_finally_californication_during_8_19(Start,End),AllINtervals), checkvalidity(1890,AllINtervals,Res).

check_query() :- write('Query = neg_finally_californication_during_8_19_at_1890'), (neg_finally_californication_during_8_19_at_1890(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_californication_during_8_19_aux().

