:- include('database.pl').
war_in_afghanistan(Start,End) :- begin('war_in_afghanistan',_,_,Start), end('war_in_afghanistan',_,_,End), Start=<End.

compare_war_in_afghanistan(Dir,war_in_afghanistan(Start1,_),war_in_afghanistan(Start2,_)) :- Start1=<Start2.

generate_neg_war_in_afghanistan([]).

generate_neg_war_in_afghanistan([(Start,End) | Tail]) :- assert(neg_war_in_afghanistan(Start,End)), generate_neg_war_in_afghanistan(Tail).

sort_war_in_afghanistan(SortedIntervals) :- findall((Start,End),war_in_afghanistan(Start,End),UnsortedIntervals), predsort(compare_war_in_afghanistan,UnsortedIntervals,SortedIntervals).

generate_neg_war_in_afghanistan_aux() :- sort_war_in_afghanistan(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_war_in_afghanistan(NegatedIntervals).

neg_war_in_afghanistan_at_1610(Res) :- setof((Start,End),neg_war_in_afghanistan(Start,End),AllINtervals), checkvalidity(1610,AllINtervals,Res).

check_query() :- write('Query = neg_war_in_afghanistan_at_1610'), (neg_war_in_afghanistan_at_1610(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_war_in_afghanistan_aux().

