:- include('database.pl').
qing_dynasty(Start,End) :- begin('qing_dynasty',_,_,Start), end('qing_dynasty',_,_,End), Start=<End.

compare_qing_dynasty(Dir,qing_dynasty(Start1,_),qing_dynasty(Start2,_)) :- Start1=<Start2.

generate_neg_qing_dynasty([]).

generate_neg_qing_dynasty([(Start,End) | Tail]) :- assert(neg_qing_dynasty(Start,End)), generate_neg_qing_dynasty(Tail).

sort_qing_dynasty(SortedIntervals) :- findall((Start,End),qing_dynasty(Start,End),UnsortedIntervals), predsort(compare_qing_dynasty,UnsortedIntervals,SortedIntervals).

generate_neg_qing_dynasty_aux() :- sort_qing_dynasty(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_qing_dynasty(NegatedIntervals).

neg_qing_dynasty_at_655(Res) :- setof((Start,End),neg_qing_dynasty(Start,End),AllINtervals), checkvalidity(655,AllINtervals,Res).

check_query() :- write('Query = neg_qing_dynasty_at_655'), (neg_qing_dynasty_at_655(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_qing_dynasty_aux().

