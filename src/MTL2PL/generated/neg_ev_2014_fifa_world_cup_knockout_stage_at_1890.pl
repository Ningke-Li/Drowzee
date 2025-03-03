:- include('database.pl').
ev_2014_fifa_world_cup_knockout_stage(Start,End) :- begin('ev_2014_fifa_world_cup_knockout_stage',_,_,Start), end('ev_2014_fifa_world_cup_knockout_stage',_,_,End), Start=<End.

compare_ev_2014_fifa_world_cup_knockout_stage(Dir,ev_2014_fifa_world_cup_knockout_stage(Start1,_),ev_2014_fifa_world_cup_knockout_stage(Start2,_)) :- Start1=<Start2.

generate_neg_ev_2014_fifa_world_cup_knockout_stage([]).

generate_neg_ev_2014_fifa_world_cup_knockout_stage([(Start,End) | Tail]) :- assert(neg_ev_2014_fifa_world_cup_knockout_stage(Start,End)), generate_neg_ev_2014_fifa_world_cup_knockout_stage(Tail).

sort_ev_2014_fifa_world_cup_knockout_stage(SortedIntervals) :- findall((Start,End),ev_2014_fifa_world_cup_knockout_stage(Start,End),UnsortedIntervals), predsort(compare_ev_2014_fifa_world_cup_knockout_stage,UnsortedIntervals,SortedIntervals).

generate_neg_ev_2014_fifa_world_cup_knockout_stage_aux() :- sort_ev_2014_fifa_world_cup_knockout_stage(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ev_2014_fifa_world_cup_knockout_stage(NegatedIntervals).

neg_ev_2014_fifa_world_cup_knockout_stage_at_1890(Res) :- setof((Start,End),neg_ev_2014_fifa_world_cup_knockout_stage(Start,End),AllINtervals), checkvalidity(1890,AllINtervals,Res).

check_query() :- write('Query = neg_ev_2014_fifa_world_cup_knockout_stage_at_1890'), (neg_ev_2014_fifa_world_cup_knockout_stage_at_1890(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ev_2014_fifa_world_cup_knockout_stage_aux().

