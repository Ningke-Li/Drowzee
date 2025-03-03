:- include('database.pl').
three_hundred_and_thirty_five_years__war(Start,End) :- begin('three_hundred_and_thirty_five_years__war',_,_,Start), end('three_hundred_and_thirty_five_years__war',_,_,End), Start=<End.

finally_three_hundred_and_thirty_five_years__war_during_3_20(Start,End) :- three_hundred_and_thirty_five_years__war(Start1,End1), (Start1-20)=<(End1-3), Start is (Start1-20), End is (End1-3), Start=<End.

compare_finally_three_hundred_and_thirty_five_years__war_during_3_20(Dir,finally_three_hundred_and_thirty_five_years__war_during_3_20(Start1,_),finally_three_hundred_and_thirty_five_years__war_during_3_20(Start2,_)) :- Start1=<Start2.

generate_neg_finally_three_hundred_and_thirty_five_years__war_during_3_20([]).

generate_neg_finally_three_hundred_and_thirty_five_years__war_during_3_20([(Start,End) | Tail]) :- assert(neg_finally_three_hundred_and_thirty_five_years__war_during_3_20(Start,End)), generate_neg_finally_three_hundred_and_thirty_five_years__war_during_3_20(Tail).

sort_finally_three_hundred_and_thirty_five_years__war_during_3_20(SortedIntervals) :- findall((Start,End),finally_three_hundred_and_thirty_five_years__war_during_3_20(Start,End),UnsortedIntervals), predsort(compare_finally_three_hundred_and_thirty_five_years__war_during_3_20,UnsortedIntervals,SortedIntervals).

generate_neg_finally_three_hundred_and_thirty_five_years__war_during_3_20_aux() :- sort_finally_three_hundred_and_thirty_five_years__war_during_3_20(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_three_hundred_and_thirty_five_years__war_during_3_20(NegatedIntervals).

neg_finally_three_hundred_and_thirty_five_years__war_during_3_20_at_807(Res) :- setof((Start,End),neg_finally_three_hundred_and_thirty_five_years__war_during_3_20(Start,End),AllINtervals), checkvalidity(807,AllINtervals,Res).

check_query() :- write('Query = neg_finally_three_hundred_and_thirty_five_years__war_during_3_20_at_807'), (neg_finally_three_hundred_and_thirty_five_years__war_during_3_20_at_807(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_three_hundred_and_thirty_five_years__war_during_3_20_aux().

