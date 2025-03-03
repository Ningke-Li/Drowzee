:- include('database.pl').
napoleonic_wars(Start,End) :- begin('napoleonic_wars',_,_,Start), end('napoleonic_wars',_,_,End), Start=<End.

compare_napoleonic_wars(Dir,napoleonic_wars(Start1,_),napoleonic_wars(Start2,_)) :- Start1=<Start2.

generate_neg_napoleonic_wars([]).

generate_neg_napoleonic_wars([(Start,End) | Tail]) :- assert(neg_napoleonic_wars(Start,End)), generate_neg_napoleonic_wars(Tail).

sort_napoleonic_wars(SortedIntervals) :- findall((Start,End),napoleonic_wars(Start,End),UnsortedIntervals), predsort(compare_napoleonic_wars,UnsortedIntervals,SortedIntervals).

generate_neg_napoleonic_wars_aux() :- sort_napoleonic_wars(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_napoleonic_wars(NegatedIntervals).

neg_napoleonic_wars_at_1468(Res) :- setof((Start,End),neg_napoleonic_wars(Start,End),AllINtervals), checkvalidity(1468,AllINtervals,Res).

check_query() :- write('Query = neg_napoleonic_wars_at_1468'), (neg_napoleonic_wars_at_1468(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_napoleonic_wars_aux().

