:- include('database.pl').
adventure_time(Start,End) :- begin('adventure_time',_,_,Start), end('adventure_time',_,_,End), Start=<End.

compare_adventure_time(Dir,adventure_time(Start1,_),adventure_time(Start2,_)) :- Start1=<Start2.

generate_neg_adventure_time([]).

generate_neg_adventure_time([(Start,End) | Tail]) :- assert(neg_adventure_time(Start,End)), generate_neg_adventure_time(Tail).

sort_adventure_time(SortedIntervals) :- findall((Start,End),adventure_time(Start,End),UnsortedIntervals), predsort(compare_adventure_time,UnsortedIntervals,SortedIntervals).

generate_neg_adventure_time_aux() :- sort_adventure_time(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_adventure_time(NegatedIntervals).

neg_adventure_time_at_1936(Res) :- setof((Start,End),neg_adventure_time(Start,End),AllINtervals), checkvalidity(1936,AllINtervals,Res).

check_query() :- write('Query = neg_adventure_time_at_1936'), (neg_adventure_time_at_1936(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_adventure_time_aux().

