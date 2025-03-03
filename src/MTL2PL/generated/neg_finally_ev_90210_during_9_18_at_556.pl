:- include('database.pl').
ev_90210(Start,End) :- begin('ev_90210',_,_,Start), end('ev_90210',_,_,End), Start=<End.

finally_ev_90210_during_9_18(Start,End) :- ev_90210(Start1,End1), (Start1-18)=<(End1-9), Start is (Start1-18), End is (End1-9), Start=<End.

compare_finally_ev_90210_during_9_18(Dir,finally_ev_90210_during_9_18(Start1,_),finally_ev_90210_during_9_18(Start2,_)) :- Start1=<Start2.

generate_neg_finally_ev_90210_during_9_18([]).

generate_neg_finally_ev_90210_during_9_18([(Start,End) | Tail]) :- assert(neg_finally_ev_90210_during_9_18(Start,End)), generate_neg_finally_ev_90210_during_9_18(Tail).

sort_finally_ev_90210_during_9_18(SortedIntervals) :- findall((Start,End),finally_ev_90210_during_9_18(Start,End),UnsortedIntervals), predsort(compare_finally_ev_90210_during_9_18,UnsortedIntervals,SortedIntervals).

generate_neg_finally_ev_90210_during_9_18_aux() :- sort_finally_ev_90210_during_9_18(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_ev_90210_during_9_18(NegatedIntervals).

neg_finally_ev_90210_during_9_18_at_556(Res) :- setof((Start,End),neg_finally_ev_90210_during_9_18(Start,End),AllINtervals), checkvalidity(556,AllINtervals,Res).

check_query() :- write('Query = neg_finally_ev_90210_during_9_18_at_556'), (neg_finally_ev_90210_during_9_18_at_556(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_ev_90210_during_9_18_aux().

