:- include('database.pl').
austin___ally(Start,End) :- begin('austin___ally',_,_,Start), end('austin___ally',_,_,End), Start=<End.

finally_austin___ally_during_9_16(Start,End) :- austin___ally(Start1,End1), (Start1-16)=<(End1-9), Start is (Start1-16), End is (End1-9), Start=<End.

compare_finally_austin___ally_during_9_16(Dir,finally_austin___ally_during_9_16(Start1,_),finally_austin___ally_during_9_16(Start2,_)) :- Start1=<Start2.

generate_neg_finally_austin___ally_during_9_16([]).

generate_neg_finally_austin___ally_during_9_16([(Start,End) | Tail]) :- assert(neg_finally_austin___ally_during_9_16(Start,End)), generate_neg_finally_austin___ally_during_9_16(Tail).

sort_finally_austin___ally_during_9_16(SortedIntervals) :- findall((Start,End),finally_austin___ally_during_9_16(Start,End),UnsortedIntervals), predsort(compare_finally_austin___ally_during_9_16,UnsortedIntervals,SortedIntervals).

generate_neg_finally_austin___ally_during_9_16_aux() :- sort_finally_austin___ally_during_9_16(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_austin___ally_during_9_16(NegatedIntervals).

neg_finally_austin___ally_during_9_16_at_2043(Res) :- setof((Start,End),neg_finally_austin___ally_during_9_16(Start,End),AllINtervals), checkvalidity(2043,AllINtervals,Res).

check_query() :- write('Query = neg_finally_austin___ally_during_9_16_at_2043'), (neg_finally_austin___ally_during_9_16_at_2043(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_austin___ally_during_9_16_aux().

