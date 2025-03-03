:- include('database.pl').
austin___ally(Start,End) :- begin('austin___ally',_,_,Start), end('austin___ally',_,_,End), Start=<End.

finally_austin___ally_during_6_17(Start,End) :- austin___ally(Start1,End1), (Start1-17)=<(End1-6), Start is (Start1-17), End is (End1-6), Start=<End.

compare_finally_austin___ally_during_6_17(Dir,finally_austin___ally_during_6_17(Start1,_),finally_austin___ally_during_6_17(Start2,_)) :- Start1=<Start2.

generate_neg_finally_austin___ally_during_6_17([]).

generate_neg_finally_austin___ally_during_6_17([(Start,End) | Tail]) :- assert(neg_finally_austin___ally_during_6_17(Start,End)), generate_neg_finally_austin___ally_during_6_17(Tail).

sort_finally_austin___ally_during_6_17(SortedIntervals) :- findall((Start,End),finally_austin___ally_during_6_17(Start,End),UnsortedIntervals), predsort(compare_finally_austin___ally_during_6_17,UnsortedIntervals,SortedIntervals).

generate_neg_finally_austin___ally_during_6_17_aux() :- sort_finally_austin___ally_during_6_17(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_austin___ally_during_6_17(NegatedIntervals).

neg_finally_austin___ally_during_6_17_at_1008(Res) :- setof((Start,End),neg_finally_austin___ally_during_6_17(Start,End),AllINtervals), checkvalidity(1008,AllINtervals,Res).

check_query() :- write('Query = neg_finally_austin___ally_during_6_17_at_1008'), (neg_finally_austin___ally_during_6_17_at_1008(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_austin___ally_during_6_17_aux().

