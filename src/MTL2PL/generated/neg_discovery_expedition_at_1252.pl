:- include('database.pl').
discovery_expedition(Start,End) :- begin('discovery_expedition',_,_,Start), end('discovery_expedition',_,_,End), Start=<End.

compare_discovery_expedition(Dir,discovery_expedition(Start1,_),discovery_expedition(Start2,_)) :- Start1=<Start2.

generate_neg_discovery_expedition([]).

generate_neg_discovery_expedition([(Start,End) | Tail]) :- assert(neg_discovery_expedition(Start,End)), generate_neg_discovery_expedition(Tail).

sort_discovery_expedition(SortedIntervals) :- findall((Start,End),discovery_expedition(Start,End),UnsortedIntervals), predsort(compare_discovery_expedition,UnsortedIntervals,SortedIntervals).

generate_neg_discovery_expedition_aux() :- sort_discovery_expedition(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_discovery_expedition(NegatedIntervals).

neg_discovery_expedition_at_1252(Res) :- setof((Start,End),neg_discovery_expedition(Start,End),AllINtervals), checkvalidity(1252,AllINtervals,Res).

check_query() :- write('Query = neg_discovery_expedition_at_1252'), (neg_discovery_expedition_at_1252(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_discovery_expedition_aux().

