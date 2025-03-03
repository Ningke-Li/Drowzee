:- include('database.pl').
art_nouveau(Start,End) :- begin('art_nouveau',_,_,Start), end('art_nouveau',_,_,End), Start=<End.

compare_art_nouveau(Dir,art_nouveau(Start1,_),art_nouveau(Start2,_)) :- Start1=<Start2.

generate_neg_art_nouveau([]).

generate_neg_art_nouveau([(Start,End) | Tail]) :- assert(neg_art_nouveau(Start,End)), generate_neg_art_nouveau(Tail).

sort_art_nouveau(SortedIntervals) :- findall((Start,End),art_nouveau(Start,End),UnsortedIntervals), predsort(compare_art_nouveau,UnsortedIntervals,SortedIntervals).

generate_neg_art_nouveau_aux() :- sort_art_nouveau(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_art_nouveau(NegatedIntervals).

neg_art_nouveau_at_1728(Res) :- setof((Start,End),neg_art_nouveau(Start,End),AllINtervals), checkvalidity(1728,AllINtervals,Res).

check_query() :- write('Query = neg_art_nouveau_at_1728'), (neg_art_nouveau_at_1728(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_art_nouveau_aux().

