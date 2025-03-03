:- include('database.pl').
deluge(Start,End) :- begin('deluge',_,_,Start), end('deluge',_,_,End), Start=<End.

finally_deluge_during_7_20(Start,End) :- deluge(Start1,End1), (Start1-20)=<(End1-7), Start is (Start1-20), End is (End1-7), Start=<End.

compare_finally_deluge_during_7_20(Dir,finally_deluge_during_7_20(Start1,_),finally_deluge_during_7_20(Start2,_)) :- Start1=<Start2.

generate_neg_finally_deluge_during_7_20([]).

generate_neg_finally_deluge_during_7_20([(Start,End) | Tail]) :- assert(neg_finally_deluge_during_7_20(Start,End)), generate_neg_finally_deluge_during_7_20(Tail).

sort_finally_deluge_during_7_20(SortedIntervals) :- findall((Start,End),finally_deluge_during_7_20(Start,End),UnsortedIntervals), predsort(compare_finally_deluge_during_7_20,UnsortedIntervals,SortedIntervals).

generate_neg_finally_deluge_during_7_20_aux() :- sort_finally_deluge_during_7_20(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_deluge_during_7_20(NegatedIntervals).

neg_finally_deluge_during_7_20_at_1543(Res) :- setof((Start,End),neg_finally_deluge_during_7_20(Start,End),AllINtervals), checkvalidity(1543,AllINtervals,Res).

check_query() :- write('Query = neg_finally_deluge_during_7_20_at_1543'), (neg_finally_deluge_during_7_20_at_1543(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_deluge_during_7_20_aux().

