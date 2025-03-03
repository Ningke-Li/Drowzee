:- include('database.pl').
the_tudors(Start,End) :- begin('the_tudors',_,_,Start), end('the_tudors',_,_,End), Start=<End.

finally_the_tudors_during_3_19(Start,End) :- the_tudors(Start1,End1), (Start1-19)=<(End1-3), Start is (Start1-19), End is (End1-3), Start=<End.

compare_finally_the_tudors_during_3_19(Dir,finally_the_tudors_during_3_19(Start1,_),finally_the_tudors_during_3_19(Start2,_)) :- Start1=<Start2.

generate_neg_finally_the_tudors_during_3_19([]).

generate_neg_finally_the_tudors_during_3_19([(Start,End) | Tail]) :- assert(neg_finally_the_tudors_during_3_19(Start,End)), generate_neg_finally_the_tudors_during_3_19(Tail).

sort_finally_the_tudors_during_3_19(SortedIntervals) :- findall((Start,End),finally_the_tudors_during_3_19(Start,End),UnsortedIntervals), predsort(compare_finally_the_tudors_during_3_19,UnsortedIntervals,SortedIntervals).

generate_neg_finally_the_tudors_during_3_19_aux() :- sort_finally_the_tudors_during_3_19(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_the_tudors_during_3_19(NegatedIntervals).

neg_finally_the_tudors_during_3_19_at_387(Res) :- setof((Start,End),neg_finally_the_tudors_during_3_19(Start,End),AllINtervals), checkvalidity(387,AllINtervals,Res).

check_query() :- write('Query = neg_finally_the_tudors_during_3_19_at_387'), (neg_finally_the_tudors_during_3_19_at_387(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_the_tudors_during_3_19_aux().

