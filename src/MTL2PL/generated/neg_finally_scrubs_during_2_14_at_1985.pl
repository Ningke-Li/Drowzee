:- include('database.pl').
scrubs(Start,End) :- begin('scrubs',_,_,Start), end('scrubs',_,_,End), Start=<End.

finally_scrubs_during_2_14(Start,End) :- scrubs(Start1,End1), (Start1-14)=<(End1-2), Start is (Start1-14), End is (End1-2), Start=<End.

compare_finally_scrubs_during_2_14(Dir,finally_scrubs_during_2_14(Start1,_),finally_scrubs_during_2_14(Start2,_)) :- Start1=<Start2.

generate_neg_finally_scrubs_during_2_14([]).

generate_neg_finally_scrubs_during_2_14([(Start,End) | Tail]) :- assert(neg_finally_scrubs_during_2_14(Start,End)), generate_neg_finally_scrubs_during_2_14(Tail).

sort_finally_scrubs_during_2_14(SortedIntervals) :- findall((Start,End),finally_scrubs_during_2_14(Start,End),UnsortedIntervals), predsort(compare_finally_scrubs_during_2_14,UnsortedIntervals,SortedIntervals).

generate_neg_finally_scrubs_during_2_14_aux() :- sort_finally_scrubs_during_2_14(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_scrubs_during_2_14(NegatedIntervals).

neg_finally_scrubs_during_2_14_at_1985(Res) :- setof((Start,End),neg_finally_scrubs_during_2_14(Start,End),AllINtervals), checkvalidity(1985,AllINtervals,Res).

check_query() :- write('Query = neg_finally_scrubs_during_2_14_at_1985'), (neg_finally_scrubs_during_2_14_at_1985(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_scrubs_during_2_14_aux().

