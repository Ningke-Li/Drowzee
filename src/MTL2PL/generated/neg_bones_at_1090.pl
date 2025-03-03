:- include('database.pl').
bones(Start,End) :- begin('bones',_,_,Start), end('bones',_,_,End), Start=<End.

compare_bones(Dir,bones(Start1,_),bones(Start2,_)) :- Start1=<Start2.

generate_neg_bones([]).

generate_neg_bones([(Start,End) | Tail]) :- assert(neg_bones(Start,End)), generate_neg_bones(Tail).

sort_bones(SortedIntervals) :- findall((Start,End),bones(Start,End),UnsortedIntervals), predsort(compare_bones,UnsortedIntervals,SortedIntervals).

generate_neg_bones_aux() :- sort_bones(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_bones(NegatedIntervals).

neg_bones_at_1090(Res) :- setof((Start,End),neg_bones(Start,End),AllINtervals), checkvalidity(1090,AllINtervals,Res).

check_query() :- write('Query = neg_bones_at_1090'), (neg_bones_at_1090(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_bones_aux().

