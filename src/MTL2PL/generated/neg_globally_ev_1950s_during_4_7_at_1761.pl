:- include('database.pl').
ev_1950s(Start,End) :- begin('ev_1950s',_,_,Start), end('ev_1950s',_,_,End), Start=<End.

globally_ev_1950s_during_4_7(Start,End) :- ev_1950s(Start1,End1), Start is (Start1-4), End is (End1-7), Start=<End.

compare_globally_ev_1950s_during_4_7(Dir,globally_ev_1950s_during_4_7(Start1,_),globally_ev_1950s_during_4_7(Start2,_)) :- Start1=<Start2.

generate_neg_globally_ev_1950s_during_4_7([]).

generate_neg_globally_ev_1950s_during_4_7([(Start,End) | Tail]) :- assert(neg_globally_ev_1950s_during_4_7(Start,End)), generate_neg_globally_ev_1950s_during_4_7(Tail).

sort_globally_ev_1950s_during_4_7(SortedIntervals) :- findall((Start,End),globally_ev_1950s_during_4_7(Start,End),UnsortedIntervals), predsort(compare_globally_ev_1950s_during_4_7,UnsortedIntervals,SortedIntervals).

generate_neg_globally_ev_1950s_during_4_7_aux() :- sort_globally_ev_1950s_during_4_7(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_ev_1950s_during_4_7(NegatedIntervals).

neg_globally_ev_1950s_during_4_7_at_1761(Res) :- setof((Start,End),neg_globally_ev_1950s_during_4_7(Start,End),AllINtervals), checkvalidity(1761,AllINtervals,Res).

check_query() :- write('Query = neg_globally_ev_1950s_during_4_7_at_1761'), (neg_globally_ev_1950s_during_4_7_at_1761(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_ev_1950s_during_4_7_aux().

