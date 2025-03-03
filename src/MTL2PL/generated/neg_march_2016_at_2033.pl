:- include('database.pl').
march_2016(Start,End) :- begin('march_2016',_,_,Start), end('march_2016',_,_,End), Start=<End.

compare_march_2016(Dir,march_2016(Start1,_),march_2016(Start2,_)) :- Start1=<Start2.

generate_neg_march_2016([]).

generate_neg_march_2016([(Start,End) | Tail]) :- assert(neg_march_2016(Start,End)), generate_neg_march_2016(Tail).

sort_march_2016(SortedIntervals) :- findall((Start,End),march_2016(Start,End),UnsortedIntervals), predsort(compare_march_2016,UnsortedIntervals,SortedIntervals).

generate_neg_march_2016_aux() :- sort_march_2016(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_march_2016(NegatedIntervals).

neg_march_2016_at_2033(Res) :- setof((Start,End),neg_march_2016(Start,End),AllINtervals), checkvalidity(2033,AllINtervals,Res).

check_query() :- write('Query = neg_march_2016_at_2033'), (neg_march_2016_at_2033(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_march_2016_aux().

