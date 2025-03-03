:- include('database.pl').
balkans_theater(Start,End) :- begin('balkans_theater',_,_,Start), end('balkans_theater',_,_,End), Start=<End.

finally_balkans_theater_during_10_13(Start,End) :- balkans_theater(Start1,End1), (Start1-13)=<(End1-10), Start is (Start1-13), End is (End1-10), Start=<End.

compare_finally_balkans_theater_during_10_13(Dir,finally_balkans_theater_during_10_13(Start1,_),finally_balkans_theater_during_10_13(Start2,_)) :- Start1=<Start2.

generate_neg_finally_balkans_theater_during_10_13([]).

generate_neg_finally_balkans_theater_during_10_13([(Start,End) | Tail]) :- assert(neg_finally_balkans_theater_during_10_13(Start,End)), generate_neg_finally_balkans_theater_during_10_13(Tail).

sort_finally_balkans_theater_during_10_13(SortedIntervals) :- findall((Start,End),finally_balkans_theater_during_10_13(Start,End),UnsortedIntervals), predsort(compare_finally_balkans_theater_during_10_13,UnsortedIntervals,SortedIntervals).

generate_neg_finally_balkans_theater_during_10_13_aux() :- sort_finally_balkans_theater_during_10_13(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_balkans_theater_during_10_13(NegatedIntervals).

neg_finally_balkans_theater_during_10_13_at_265(Res) :- setof((Start,End),neg_finally_balkans_theater_during_10_13(Start,End),AllINtervals), checkvalidity(265,AllINtervals,Res).

check_query() :- write('Query = neg_finally_balkans_theater_during_10_13_at_265'), (neg_finally_balkans_theater_during_10_13_at_265(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_balkans_theater_during_10_13_aux().

