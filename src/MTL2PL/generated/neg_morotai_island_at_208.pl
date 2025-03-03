:- include('database.pl').
morotai_island(Start,End) :- begin('morotai_island',_,_,Start), end('morotai_island',_,_,End), Start=<End.

compare_morotai_island(Dir,morotai_island(Start1,_),morotai_island(Start2,_)) :- Start1=<Start2.

generate_neg_morotai_island([]).

generate_neg_morotai_island([(Start,End) | Tail]) :- assert(neg_morotai_island(Start,End)), generate_neg_morotai_island(Tail).

sort_morotai_island(SortedIntervals) :- findall((Start,End),morotai_island(Start,End),UnsortedIntervals), predsort(compare_morotai_island,UnsortedIntervals,SortedIntervals).

generate_neg_morotai_island_aux() :- sort_morotai_island(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_morotai_island(NegatedIntervals).

neg_morotai_island_at_208(Res) :- setof((Start,End),neg_morotai_island(Start,End),AllINtervals), checkvalidity(208,AllINtervals,Res).

check_query() :- write('Query = neg_morotai_island_at_208'), (neg_morotai_island_at_208(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_morotai_island_aux().

