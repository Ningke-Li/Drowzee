:- include('database.pl').
july_2005(Start,End) :- begin('july_2005',_,_,Start), end('july_2005',_,_,End), Start=<End.

compare_july_2005(Dir,july_2005(Start1,_),july_2005(Start2,_)) :- Start1=<Start2.

generate_neg_july_2005([]).

generate_neg_july_2005([(Start,End) | Tail]) :- assert(neg_july_2005(Start,End)), generate_neg_july_2005(Tail).

sort_july_2005(SortedIntervals) :- findall((Start,End),july_2005(Start,End),UnsortedIntervals), predsort(compare_july_2005,UnsortedIntervals,SortedIntervals).

generate_neg_july_2005_aux() :- sort_july_2005(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_july_2005(NegatedIntervals).

neg_july_2005_at_882(Res) :- setof((Start,End),neg_july_2005(Start,End),AllINtervals), checkvalidity(882,AllINtervals,Res).

check_query() :- write('Query = neg_july_2005_at_882'), (neg_july_2005_at_882(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_july_2005_aux().

