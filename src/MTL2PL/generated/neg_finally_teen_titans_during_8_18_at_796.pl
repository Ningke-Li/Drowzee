:- include('database.pl').
teen_titans(Start,End) :- begin('teen_titans',_,_,Start), end('teen_titans',_,_,End), Start=<End.

finally_teen_titans_during_8_18(Start,End) :- teen_titans(Start1,End1), (Start1-18)=<(End1-8), Start is (Start1-18), End is (End1-8), Start=<End.

compare_finally_teen_titans_during_8_18(Dir,finally_teen_titans_during_8_18(Start1,_),finally_teen_titans_during_8_18(Start2,_)) :- Start1=<Start2.

generate_neg_finally_teen_titans_during_8_18([]).

generate_neg_finally_teen_titans_during_8_18([(Start,End) | Tail]) :- assert(neg_finally_teen_titans_during_8_18(Start,End)), generate_neg_finally_teen_titans_during_8_18(Tail).

sort_finally_teen_titans_during_8_18(SortedIntervals) :- findall((Start,End),finally_teen_titans_during_8_18(Start,End),UnsortedIntervals), predsort(compare_finally_teen_titans_during_8_18,UnsortedIntervals,SortedIntervals).

generate_neg_finally_teen_titans_during_8_18_aux() :- sort_finally_teen_titans_during_8_18(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_teen_titans_during_8_18(NegatedIntervals).

neg_finally_teen_titans_during_8_18_at_796(Res) :- setof((Start,End),neg_finally_teen_titans_during_8_18(Start,End),AllINtervals), checkvalidity(796,AllINtervals,Res).

check_query() :- write('Query = neg_finally_teen_titans_during_8_18_at_796'), (neg_finally_teen_titans_during_8_18_at_796(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_teen_titans_during_8_18_aux().

