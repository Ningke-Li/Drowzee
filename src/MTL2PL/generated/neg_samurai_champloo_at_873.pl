:- include('database.pl').
samurai_champloo(Start,End) :- begin('samurai_champloo',_,_,Start), end('samurai_champloo',_,_,End), Start=<End.

compare_samurai_champloo(Dir,samurai_champloo(Start1,_),samurai_champloo(Start2,_)) :- Start1=<Start2.

generate_neg_samurai_champloo([]).

generate_neg_samurai_champloo([(Start,End) | Tail]) :- assert(neg_samurai_champloo(Start,End)), generate_neg_samurai_champloo(Tail).

sort_samurai_champloo(SortedIntervals) :- findall((Start,End),samurai_champloo(Start,End),UnsortedIntervals), predsort(compare_samurai_champloo,UnsortedIntervals,SortedIntervals).

generate_neg_samurai_champloo_aux() :- sort_samurai_champloo(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_samurai_champloo(NegatedIntervals).

neg_samurai_champloo_at_873(Res) :- setof((Start,End),neg_samurai_champloo(Start,End),AllINtervals), checkvalidity(873,AllINtervals,Res).

check_query() :- write('Query = neg_samurai_champloo_at_873'), (neg_samurai_champloo_at_873(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_samurai_champloo_aux().

