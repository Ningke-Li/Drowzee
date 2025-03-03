:- include('database.pl').
ev_2014_fifa_world_cup_group_e(Start,End) :- begin('ev_2014_fifa_world_cup_group_e',_,_,Start), end('ev_2014_fifa_world_cup_group_e',_,_,End), Start=<End.

compare_ev_2014_fifa_world_cup_group_e(Dir,ev_2014_fifa_world_cup_group_e(Start1,_),ev_2014_fifa_world_cup_group_e(Start2,_)) :- Start1=<Start2.

generate_neg_ev_2014_fifa_world_cup_group_e([]).

generate_neg_ev_2014_fifa_world_cup_group_e([(Start,End) | Tail]) :- assert(neg_ev_2014_fifa_world_cup_group_e(Start,End)), generate_neg_ev_2014_fifa_world_cup_group_e(Tail).

sort_ev_2014_fifa_world_cup_group_e(SortedIntervals) :- findall((Start,End),ev_2014_fifa_world_cup_group_e(Start,End),UnsortedIntervals), predsort(compare_ev_2014_fifa_world_cup_group_e,UnsortedIntervals,SortedIntervals).

generate_neg_ev_2014_fifa_world_cup_group_e_aux() :- sort_ev_2014_fifa_world_cup_group_e(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ev_2014_fifa_world_cup_group_e(NegatedIntervals).

neg_ev_2014_fifa_world_cup_group_e_at_1162(Res) :- setof((Start,End),neg_ev_2014_fifa_world_cup_group_e(Start,End),AllINtervals), checkvalidity(1162,AllINtervals,Res).

check_query() :- write('Query = neg_ev_2014_fifa_world_cup_group_e_at_1162'), (neg_ev_2014_fifa_world_cup_group_e_at_1162(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ev_2014_fifa_world_cup_group_e_aux().

