:- include('database.pl').
ev_1400s(Start,End) :- begin('ev_1400s',_,_,Start), end('ev_1400s',_,_,End), Start=<End.

globally_ev_1400s_during_2_9(Start,End) :- ev_1400s(Start1,End1), Start is (Start1-2), End is (End1-9), Start=<End.

compare_globally_ev_1400s_during_2_9(Dir,globally_ev_1400s_during_2_9(Start1,_),globally_ev_1400s_during_2_9(Start2,_)) :- Start1=<Start2.

generate_neg_globally_ev_1400s_during_2_9([]).

generate_neg_globally_ev_1400s_during_2_9([(Start,End) | Tail]) :- assert(neg_globally_ev_1400s_during_2_9(Start,End)), generate_neg_globally_ev_1400s_during_2_9(Tail).

sort_globally_ev_1400s_during_2_9(SortedIntervals) :- findall((Start,End),globally_ev_1400s_during_2_9(Start,End),UnsortedIntervals), predsort(compare_globally_ev_1400s_during_2_9,UnsortedIntervals,SortedIntervals).

generate_neg_globally_ev_1400s_during_2_9_aux() :- sort_globally_ev_1400s_during_2_9(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_ev_1400s_during_2_9(NegatedIntervals).

neg_globally_ev_1400s_during_2_9_at_1668(Res) :- setof((Start,End),neg_globally_ev_1400s_during_2_9(Start,End),AllINtervals), checkvalidity(1668,AllINtervals,Res).

check_query() :- write('Query = neg_globally_ev_1400s_during_2_9_at_1668'), (neg_globally_ev_1400s_during_2_9_at_1668(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_ev_1400s_during_2_9_aux().

