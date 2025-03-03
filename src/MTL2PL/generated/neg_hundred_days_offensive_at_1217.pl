:- include('database.pl').
hundred_days_offensive(Start,End) :- begin('hundred_days_offensive',_,_,Start), end('hundred_days_offensive',_,_,End), Start=<End.

compare_hundred_days_offensive(Dir,hundred_days_offensive(Start1,_),hundred_days_offensive(Start2,_)) :- Start1=<Start2.

generate_neg_hundred_days_offensive([]).

generate_neg_hundred_days_offensive([(Start,End) | Tail]) :- assert(neg_hundred_days_offensive(Start,End)), generate_neg_hundred_days_offensive(Tail).

sort_hundred_days_offensive(SortedIntervals) :- findall((Start,End),hundred_days_offensive(Start,End),UnsortedIntervals), predsort(compare_hundred_days_offensive,UnsortedIntervals,SortedIntervals).

generate_neg_hundred_days_offensive_aux() :- sort_hundred_days_offensive(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_hundred_days_offensive(NegatedIntervals).

neg_hundred_days_offensive_at_1217(Res) :- setof((Start,End),neg_hundred_days_offensive(Start,End),AllINtervals), checkvalidity(1217,AllINtervals,Res).

check_query() :- write('Query = neg_hundred_days_offensive_at_1217'), (neg_hundred_days_offensive_at_1217(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_hundred_days_offensive_aux().

