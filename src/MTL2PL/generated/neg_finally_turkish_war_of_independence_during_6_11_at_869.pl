:- include('database.pl').
turkish_war_of_independence(Start,End) :- begin('turkish_war_of_independence',_,_,Start), end('turkish_war_of_independence',_,_,End), Start=<End.

finally_turkish_war_of_independence_during_6_11(Start,End) :- turkish_war_of_independence(Start1,End1), (Start1-11)=<(End1-6), Start is (Start1-11), End is (End1-6), Start=<End.

compare_finally_turkish_war_of_independence_during_6_11(Dir,finally_turkish_war_of_independence_during_6_11(Start1,_),finally_turkish_war_of_independence_during_6_11(Start2,_)) :- Start1=<Start2.

generate_neg_finally_turkish_war_of_independence_during_6_11([]).

generate_neg_finally_turkish_war_of_independence_during_6_11([(Start,End) | Tail]) :- assert(neg_finally_turkish_war_of_independence_during_6_11(Start,End)), generate_neg_finally_turkish_war_of_independence_during_6_11(Tail).

sort_finally_turkish_war_of_independence_during_6_11(SortedIntervals) :- findall((Start,End),finally_turkish_war_of_independence_during_6_11(Start,End),UnsortedIntervals), predsort(compare_finally_turkish_war_of_independence_during_6_11,UnsortedIntervals,SortedIntervals).

generate_neg_finally_turkish_war_of_independence_during_6_11_aux() :- sort_finally_turkish_war_of_independence_during_6_11(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_turkish_war_of_independence_during_6_11(NegatedIntervals).

neg_finally_turkish_war_of_independence_during_6_11_at_869(Res) :- setof((Start,End),neg_finally_turkish_war_of_independence_during_6_11(Start,End),AllINtervals), checkvalidity(869,AllINtervals,Res).

check_query() :- write('Query = neg_finally_turkish_war_of_independence_during_6_11_at_869'), (neg_finally_turkish_war_of_independence_during_6_11_at_869(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_turkish_war_of_independence_during_6_11_aux().

