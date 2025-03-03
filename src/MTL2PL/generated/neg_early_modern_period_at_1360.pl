:- include('database.pl').
early_modern_period(Start,End) :- begin('early_modern_period',_,_,Start), end('early_modern_period',_,_,End), Start=<End.

compare_early_modern_period(Dir,early_modern_period(Start1,_),early_modern_period(Start2,_)) :- Start1=<Start2.

generate_neg_early_modern_period([]).

generate_neg_early_modern_period([(Start,End) | Tail]) :- assert(neg_early_modern_period(Start,End)), generate_neg_early_modern_period(Tail).

sort_early_modern_period(SortedIntervals) :- findall((Start,End),early_modern_period(Start,End),UnsortedIntervals), predsort(compare_early_modern_period,UnsortedIntervals,SortedIntervals).

generate_neg_early_modern_period_aux() :- sort_early_modern_period(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_early_modern_period(NegatedIntervals).

neg_early_modern_period_at_1360(Res) :- setof((Start,End),neg_early_modern_period(Start,End),AllINtervals), checkvalidity(1360,AllINtervals,Res).

check_query() :- write('Query = neg_early_modern_period_at_1360'), (neg_early_modern_period_at_1360(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_early_modern_period_aux().

