:- include('database.pl').
bombing_of_hamburg_in_world_war_ii(Start,End) :- begin('bombing_of_hamburg_in_world_war_ii',_,_,Start), end('bombing_of_hamburg_in_world_war_ii',_,_,End), Start=<End.

compare_bombing_of_hamburg_in_world_war_ii(Dir,bombing_of_hamburg_in_world_war_ii(Start1,_),bombing_of_hamburg_in_world_war_ii(Start2,_)) :- Start1=<Start2.

generate_neg_bombing_of_hamburg_in_world_war_ii([]).

generate_neg_bombing_of_hamburg_in_world_war_ii([(Start,End) | Tail]) :- assert(neg_bombing_of_hamburg_in_world_war_ii(Start,End)), generate_neg_bombing_of_hamburg_in_world_war_ii(Tail).

sort_bombing_of_hamburg_in_world_war_ii(SortedIntervals) :- findall((Start,End),bombing_of_hamburg_in_world_war_ii(Start,End),UnsortedIntervals), predsort(compare_bombing_of_hamburg_in_world_war_ii,UnsortedIntervals,SortedIntervals).

generate_neg_bombing_of_hamburg_in_world_war_ii_aux() :- sort_bombing_of_hamburg_in_world_war_ii(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_bombing_of_hamburg_in_world_war_ii(NegatedIntervals).

neg_bombing_of_hamburg_in_world_war_ii_at_1957(Res) :- setof((Start,End),neg_bombing_of_hamburg_in_world_war_ii(Start,End),AllINtervals), checkvalidity(1957,AllINtervals,Res).

check_query() :- write('Query = neg_bombing_of_hamburg_in_world_war_ii_at_1957'), (neg_bombing_of_hamburg_in_world_war_ii_at_1957(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_bombing_of_hamburg_in_world_war_ii_aux().

