:- include('database.pl').
carnatic_wars(Start,End) :- begin('carnatic_wars',_,_,Start), end('carnatic_wars',_,_,End), Start=<End.

compare_carnatic_wars(Dir,carnatic_wars(Start1,_),carnatic_wars(Start2,_)) :- Start1=<Start2.

generate_neg_carnatic_wars([]).

generate_neg_carnatic_wars([(Start,End) | Tail]) :- assert(neg_carnatic_wars(Start,End)), generate_neg_carnatic_wars(Tail).

sort_carnatic_wars(SortedIntervals) :- findall((Start,End),carnatic_wars(Start,End),UnsortedIntervals), predsort(compare_carnatic_wars,UnsortedIntervals,SortedIntervals).

generate_neg_carnatic_wars_aux() :- sort_carnatic_wars(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_carnatic_wars(NegatedIntervals).

neg_carnatic_wars_at_2026(Res) :- setof((Start,End),neg_carnatic_wars(Start,End),AllINtervals), checkvalidity(2026,AllINtervals,Res).

check_query() :- write('Query = neg_carnatic_wars_at_2026'), (neg_carnatic_wars_at_2026(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_carnatic_wars_aux().

