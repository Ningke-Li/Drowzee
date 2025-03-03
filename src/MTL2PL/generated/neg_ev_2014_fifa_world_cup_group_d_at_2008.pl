:- include('database.pl').
ev_2014_fifa_world_cup_group_d(Start,End) :- begin('ev_2014_fifa_world_cup_group_d',_,_,Start), end('ev_2014_fifa_world_cup_group_d',_,_,End), Start=<End.

compare_ev_2014_fifa_world_cup_group_d(Dir,ev_2014_fifa_world_cup_group_d(Start1,_),ev_2014_fifa_world_cup_group_d(Start2,_)) :- Start1=<Start2.

generate_neg_ev_2014_fifa_world_cup_group_d([]).

generate_neg_ev_2014_fifa_world_cup_group_d([(Start,End) | Tail]) :- assert(neg_ev_2014_fifa_world_cup_group_d(Start,End)), generate_neg_ev_2014_fifa_world_cup_group_d(Tail).

sort_ev_2014_fifa_world_cup_group_d(SortedIntervals) :- findall((Start,End),ev_2014_fifa_world_cup_group_d(Start,End),UnsortedIntervals), predsort(compare_ev_2014_fifa_world_cup_group_d,UnsortedIntervals,SortedIntervals).

generate_neg_ev_2014_fifa_world_cup_group_d_aux() :- sort_ev_2014_fifa_world_cup_group_d(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ev_2014_fifa_world_cup_group_d(NegatedIntervals).

neg_ev_2014_fifa_world_cup_group_d_at_2008(Res) :- setof((Start,End),neg_ev_2014_fifa_world_cup_group_d(Start,End),AllINtervals), checkvalidity(2008,AllINtervals,Res).

check_query() :- write('Query = neg_ev_2014_fifa_world_cup_group_d_at_2008'), (neg_ev_2014_fifa_world_cup_group_d_at_2008(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ev_2014_fifa_world_cup_group_d_aux().

