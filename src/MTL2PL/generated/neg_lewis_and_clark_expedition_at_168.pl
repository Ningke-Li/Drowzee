:- include('database.pl').
lewis_and_clark_expedition(Start,End) :- begin('lewis_and_clark_expedition',_,_,Start), end('lewis_and_clark_expedition',_,_,End), Start=<End.

compare_lewis_and_clark_expedition(Dir,lewis_and_clark_expedition(Start1,_),lewis_and_clark_expedition(Start2,_)) :- Start1=<Start2.

generate_neg_lewis_and_clark_expedition([]).

generate_neg_lewis_and_clark_expedition([(Start,End) | Tail]) :- assert(neg_lewis_and_clark_expedition(Start,End)), generate_neg_lewis_and_clark_expedition(Tail).

sort_lewis_and_clark_expedition(SortedIntervals) :- findall((Start,End),lewis_and_clark_expedition(Start,End),UnsortedIntervals), predsort(compare_lewis_and_clark_expedition,UnsortedIntervals,SortedIntervals).

generate_neg_lewis_and_clark_expedition_aux() :- sort_lewis_and_clark_expedition(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_lewis_and_clark_expedition(NegatedIntervals).

neg_lewis_and_clark_expedition_at_168(Res) :- setof((Start,End),neg_lewis_and_clark_expedition(Start,End),AllINtervals), checkvalidity(168,AllINtervals,Res).

check_query() :- write('Query = neg_lewis_and_clark_expedition_at_168'), (neg_lewis_and_clark_expedition_at_168(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_lewis_and_clark_expedition_aux().

