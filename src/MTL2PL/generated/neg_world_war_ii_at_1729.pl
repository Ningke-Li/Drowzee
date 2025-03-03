:- include('database.pl').
world_war_ii(Start,End) :- begin('world_war_ii',_,_,Start), end('world_war_ii',_,_,End), Start=<End.

compare_world_war_ii(Dir,world_war_ii(Start1,_),world_war_ii(Start2,_)) :- Start1=<Start2.

generate_neg_world_war_ii([]).

generate_neg_world_war_ii([(Start,End) | Tail]) :- assert(neg_world_war_ii(Start,End)), generate_neg_world_war_ii(Tail).

sort_world_war_ii(SortedIntervals) :- findall((Start,End),world_war_ii(Start,End),UnsortedIntervals), predsort(compare_world_war_ii,UnsortedIntervals,SortedIntervals).

generate_neg_world_war_ii_aux() :- sort_world_war_ii(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_world_war_ii(NegatedIntervals).

neg_world_war_ii_at_1729(Res) :- setof((Start,End),neg_world_war_ii(Start,End),AllINtervals), checkvalidity(1729,AllINtervals,Res).

check_query() :- write('Query = neg_world_war_ii_at_1729'), (neg_world_war_ii_at_1729(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_world_war_ii_aux().

