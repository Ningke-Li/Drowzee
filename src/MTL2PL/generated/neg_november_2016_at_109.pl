:- include('database.pl').
november_2016(Start,End) :- begin('november_2016',_,_,Start), end('november_2016',_,_,End), Start=<End.

compare_november_2016(Dir,november_2016(Start1,_),november_2016(Start2,_)) :- Start1=<Start2.

generate_neg_november_2016([]).

generate_neg_november_2016([(Start,End) | Tail]) :- assert(neg_november_2016(Start,End)), generate_neg_november_2016(Tail).

sort_november_2016(SortedIntervals) :- findall((Start,End),november_2016(Start,End),UnsortedIntervals), predsort(compare_november_2016,UnsortedIntervals,SortedIntervals).

generate_neg_november_2016_aux() :- sort_november_2016(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_november_2016(NegatedIntervals).

neg_november_2016_at_109(Res) :- setof((Start,End),neg_november_2016(Start,End),AllINtervals), checkvalidity(109,AllINtervals,Res).

check_query() :- write('Query = neg_november_2016_at_109'), (neg_november_2016_at_109(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_november_2016_aux().

