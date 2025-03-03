:- include('database.pl').
united_nations_trust_territory(Start,End) :- begin('united_nations_trust_territory',_,_,Start), end('united_nations_trust_territory',_,_,End), Start=<End.

finally_united_nations_trust_territory_during_10_17(Start,End) :- united_nations_trust_territory(Start1,End1), (Start1-17)=<(End1-10), Start is (Start1-17), End is (End1-10), Start=<End.

compare_finally_united_nations_trust_territory_during_10_17(Dir,finally_united_nations_trust_territory_during_10_17(Start1,_),finally_united_nations_trust_territory_during_10_17(Start2,_)) :- Start1=<Start2.

generate_neg_finally_united_nations_trust_territory_during_10_17([]).

generate_neg_finally_united_nations_trust_territory_during_10_17([(Start,End) | Tail]) :- assert(neg_finally_united_nations_trust_territory_during_10_17(Start,End)), generate_neg_finally_united_nations_trust_territory_during_10_17(Tail).

sort_finally_united_nations_trust_territory_during_10_17(SortedIntervals) :- findall((Start,End),finally_united_nations_trust_territory_during_10_17(Start,End),UnsortedIntervals), predsort(compare_finally_united_nations_trust_territory_during_10_17,UnsortedIntervals,SortedIntervals).

generate_neg_finally_united_nations_trust_territory_during_10_17_aux() :- sort_finally_united_nations_trust_territory_during_10_17(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_united_nations_trust_territory_during_10_17(NegatedIntervals).

neg_finally_united_nations_trust_territory_during_10_17_at_390(Res) :- setof((Start,End),neg_finally_united_nations_trust_territory_during_10_17(Start,End),AllINtervals), checkvalidity(390,AllINtervals,Res).

check_query() :- write('Query = neg_finally_united_nations_trust_territory_during_10_17_at_390'), (neg_finally_united_nations_trust_territory_during_10_17_at_390(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_united_nations_trust_territory_during_10_17_aux().

