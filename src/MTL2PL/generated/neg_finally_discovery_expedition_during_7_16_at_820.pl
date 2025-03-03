:- include('database.pl').
discovery_expedition(Start,End) :- begin('discovery_expedition',_,_,Start), end('discovery_expedition',_,_,End), Start=<End.

finally_discovery_expedition_during_7_16(Start,End) :- discovery_expedition(Start1,End1), (Start1-16)=<(End1-7), Start is (Start1-16), End is (End1-7), Start=<End.

compare_finally_discovery_expedition_during_7_16(Dir,finally_discovery_expedition_during_7_16(Start1,_),finally_discovery_expedition_during_7_16(Start2,_)) :- Start1=<Start2.

generate_neg_finally_discovery_expedition_during_7_16([]).

generate_neg_finally_discovery_expedition_during_7_16([(Start,End) | Tail]) :- assert(neg_finally_discovery_expedition_during_7_16(Start,End)), generate_neg_finally_discovery_expedition_during_7_16(Tail).

sort_finally_discovery_expedition_during_7_16(SortedIntervals) :- findall((Start,End),finally_discovery_expedition_during_7_16(Start,End),UnsortedIntervals), predsort(compare_finally_discovery_expedition_during_7_16,UnsortedIntervals,SortedIntervals).

generate_neg_finally_discovery_expedition_during_7_16_aux() :- sort_finally_discovery_expedition_during_7_16(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_discovery_expedition_during_7_16(NegatedIntervals).

neg_finally_discovery_expedition_during_7_16_at_820(Res) :- setof((Start,End),neg_finally_discovery_expedition_during_7_16(Start,End),AllINtervals), checkvalidity(820,AllINtervals,Res).

check_query() :- write('Query = neg_finally_discovery_expedition_during_7_16_at_820'), (neg_finally_discovery_expedition_during_7_16_at_820(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_discovery_expedition_during_7_16_aux().

