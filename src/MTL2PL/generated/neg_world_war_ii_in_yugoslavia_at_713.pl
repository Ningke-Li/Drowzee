:- include('database.pl').
world_war_ii_in_yugoslavia(Start,End) :- begin('world_war_ii_in_yugoslavia',_,_,Start), end('world_war_ii_in_yugoslavia',_,_,End), Start=<End.

compare_world_war_ii_in_yugoslavia(Dir,world_war_ii_in_yugoslavia(Start1,_),world_war_ii_in_yugoslavia(Start2,_)) :- Start1=<Start2.

generate_neg_world_war_ii_in_yugoslavia([]).

generate_neg_world_war_ii_in_yugoslavia([(Start,End) | Tail]) :- assert(neg_world_war_ii_in_yugoslavia(Start,End)), generate_neg_world_war_ii_in_yugoslavia(Tail).

sort_world_war_ii_in_yugoslavia(SortedIntervals) :- findall((Start,End),world_war_ii_in_yugoslavia(Start,End),UnsortedIntervals), predsort(compare_world_war_ii_in_yugoslavia,UnsortedIntervals,SortedIntervals).

generate_neg_world_war_ii_in_yugoslavia_aux() :- sort_world_war_ii_in_yugoslavia(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_world_war_ii_in_yugoslavia(NegatedIntervals).

neg_world_war_ii_in_yugoslavia_at_713(Res) :- setof((Start,End),neg_world_war_ii_in_yugoslavia(Start,End),AllINtervals), checkvalidity(713,AllINtervals,Res).

check_query() :- write('Query = neg_world_war_ii_in_yugoslavia_at_713'), (neg_world_war_ii_in_yugoslavia_at_713(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_world_war_ii_in_yugoslavia_aux().

