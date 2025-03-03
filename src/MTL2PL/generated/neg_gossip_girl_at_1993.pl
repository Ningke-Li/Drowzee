:- include('database.pl').
gossip_girl(Start,End) :- begin('gossip_girl',_,_,Start), end('gossip_girl',_,_,End), Start=<End.

compare_gossip_girl(Dir,gossip_girl(Start1,_),gossip_girl(Start2,_)) :- Start1=<Start2.

generate_neg_gossip_girl([]).

generate_neg_gossip_girl([(Start,End) | Tail]) :- assert(neg_gossip_girl(Start,End)), generate_neg_gossip_girl(Tail).

sort_gossip_girl(SortedIntervals) :- findall((Start,End),gossip_girl(Start,End),UnsortedIntervals), predsort(compare_gossip_girl,UnsortedIntervals,SortedIntervals).

generate_neg_gossip_girl_aux() :- sort_gossip_girl(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_gossip_girl(NegatedIntervals).

neg_gossip_girl_at_1993(Res) :- setof((Start,End),neg_gossip_girl(Start,End),AllINtervals), checkvalidity(1993,AllINtervals,Res).

check_query() :- write('Query = neg_gossip_girl_at_1993'), (neg_gossip_girl_at_1993(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_gossip_girl_aux().

