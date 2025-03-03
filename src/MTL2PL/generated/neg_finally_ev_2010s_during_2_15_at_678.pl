:- include('database.pl').
ev_2010s(Start,End) :- begin('ev_2010s',_,_,Start), end('ev_2010s',_,_,End), Start=<End.

finally_ev_2010s_during_2_15(Start,End) :- ev_2010s(Start1,End1), (Start1-15)=<(End1-2), Start is (Start1-15), End is (End1-2), Start=<End.

compare_finally_ev_2010s_during_2_15(Dir,finally_ev_2010s_during_2_15(Start1,_),finally_ev_2010s_during_2_15(Start2,_)) :- Start1=<Start2.

generate_neg_finally_ev_2010s_during_2_15([]).

generate_neg_finally_ev_2010s_during_2_15([(Start,End) | Tail]) :- assert(neg_finally_ev_2010s_during_2_15(Start,End)), generate_neg_finally_ev_2010s_during_2_15(Tail).

sort_finally_ev_2010s_during_2_15(SortedIntervals) :- findall((Start,End),finally_ev_2010s_during_2_15(Start,End),UnsortedIntervals), predsort(compare_finally_ev_2010s_during_2_15,UnsortedIntervals,SortedIntervals).

generate_neg_finally_ev_2010s_during_2_15_aux() :- sort_finally_ev_2010s_during_2_15(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_ev_2010s_during_2_15(NegatedIntervals).

neg_finally_ev_2010s_during_2_15_at_678(Res) :- setof((Start,End),neg_finally_ev_2010s_during_2_15(Start,End),AllINtervals), checkvalidity(678,AllINtervals,Res).

check_query() :- write('Query = neg_finally_ev_2010s_during_2_15_at_678'), (neg_finally_ev_2010s_during_2_15_at_678(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_ev_2010s_during_2_15_aux().

