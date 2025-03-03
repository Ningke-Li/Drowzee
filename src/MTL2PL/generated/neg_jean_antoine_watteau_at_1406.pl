:- include('database.pl').
jean_antoine_watteau(Start,End) :- begin('jean_antoine_watteau',_,_,Start), end('jean_antoine_watteau',_,_,End), Start=<End.

compare_jean_antoine_watteau(Dir,jean_antoine_watteau(Start1,_),jean_antoine_watteau(Start2,_)) :- Start1=<Start2.

generate_neg_jean_antoine_watteau([]).

generate_neg_jean_antoine_watteau([(Start,End) | Tail]) :- assert(neg_jean_antoine_watteau(Start,End)), generate_neg_jean_antoine_watteau(Tail).

sort_jean_antoine_watteau(SortedIntervals) :- findall((Start,End),jean_antoine_watteau(Start,End),UnsortedIntervals), predsort(compare_jean_antoine_watteau,UnsortedIntervals,SortedIntervals).

generate_neg_jean_antoine_watteau_aux() :- sort_jean_antoine_watteau(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_jean_antoine_watteau(NegatedIntervals).

neg_jean_antoine_watteau_at_1406(Res) :- setof((Start,End),neg_jean_antoine_watteau(Start,End),AllINtervals), checkvalidity(1406,AllINtervals,Res).

check_query() :- write('Query = neg_jean_antoine_watteau_at_1406'), (neg_jean_antoine_watteau_at_1406(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_jean_antoine_watteau_aux().

