:- include('database.pl').
jessica_jones(Start,End) :- begin('jessica_jones',_,_,Start), end('jessica_jones',_,_,End), Start=<End.

finally_jessica_jones_during_3_15(Start,End) :- jessica_jones(Start1,End1), (Start1-15)=<(End1-3), Start is (Start1-15), End is (End1-3), Start=<End.

compare_finally_jessica_jones_during_3_15(Dir,finally_jessica_jones_during_3_15(Start1,_),finally_jessica_jones_during_3_15(Start2,_)) :- Start1=<Start2.

generate_neg_finally_jessica_jones_during_3_15([]).

generate_neg_finally_jessica_jones_during_3_15([(Start,End) | Tail]) :- assert(neg_finally_jessica_jones_during_3_15(Start,End)), generate_neg_finally_jessica_jones_during_3_15(Tail).

sort_finally_jessica_jones_during_3_15(SortedIntervals) :- findall((Start,End),finally_jessica_jones_during_3_15(Start,End),UnsortedIntervals), predsort(compare_finally_jessica_jones_during_3_15,UnsortedIntervals,SortedIntervals).

generate_neg_finally_jessica_jones_during_3_15_aux() :- sort_finally_jessica_jones_during_3_15(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_jessica_jones_during_3_15(NegatedIntervals).

neg_finally_jessica_jones_during_3_15_at_180(Res) :- setof((Start,End),neg_finally_jessica_jones_during_3_15(Start,End),AllINtervals), checkvalidity(180,AllINtervals,Res).

check_query() :- write('Query = neg_finally_jessica_jones_during_3_15_at_180'), (neg_finally_jessica_jones_during_3_15_at_180(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_jessica_jones_during_3_15_aux().

