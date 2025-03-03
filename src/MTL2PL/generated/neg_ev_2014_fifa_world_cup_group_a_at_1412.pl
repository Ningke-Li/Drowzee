:- include('database.pl').
ev_2014_fifa_world_cup_group_a(Start,End) :- begin('ev_2014_fifa_world_cup_group_a',_,_,Start), end('ev_2014_fifa_world_cup_group_a',_,_,End), Start=<End.

compare_ev_2014_fifa_world_cup_group_a(Dir,ev_2014_fifa_world_cup_group_a(Start1,_),ev_2014_fifa_world_cup_group_a(Start2,_)) :- Start1=<Start2.

generate_neg_ev_2014_fifa_world_cup_group_a([]).

generate_neg_ev_2014_fifa_world_cup_group_a([(Start,End) | Tail]) :- assert(neg_ev_2014_fifa_world_cup_group_a(Start,End)), generate_neg_ev_2014_fifa_world_cup_group_a(Tail).

sort_ev_2014_fifa_world_cup_group_a(SortedIntervals) :- findall((Start,End),ev_2014_fifa_world_cup_group_a(Start,End),UnsortedIntervals), predsort(compare_ev_2014_fifa_world_cup_group_a,UnsortedIntervals,SortedIntervals).

generate_neg_ev_2014_fifa_world_cup_group_a_aux() :- sort_ev_2014_fifa_world_cup_group_a(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ev_2014_fifa_world_cup_group_a(NegatedIntervals).

neg_ev_2014_fifa_world_cup_group_a_at_1412(Res) :- setof((Start,End),neg_ev_2014_fifa_world_cup_group_a(Start,End),AllINtervals), checkvalidity(1412,AllINtervals,Res).

check_query() :- write('Query = neg_ev_2014_fifa_world_cup_group_a_at_1412'), (neg_ev_2014_fifa_world_cup_group_a_at_1412(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ev_2014_fifa_world_cup_group_a_aux().

