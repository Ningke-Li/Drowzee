:- include('database.pl').
middle_eastern_theater_of_world_war_i(Start,End) :- begin('middle_eastern_theater_of_world_war_i',_,_,Start), end('middle_eastern_theater_of_world_war_i',_,_,End), Start=<End.

compare_middle_eastern_theater_of_world_war_i(Dir,middle_eastern_theater_of_world_war_i(Start1,_),middle_eastern_theater_of_world_war_i(Start2,_)) :- Start1=<Start2.

generate_neg_middle_eastern_theater_of_world_war_i([]).

generate_neg_middle_eastern_theater_of_world_war_i([(Start,End) | Tail]) :- assert(neg_middle_eastern_theater_of_world_war_i(Start,End)), generate_neg_middle_eastern_theater_of_world_war_i(Tail).

sort_middle_eastern_theater_of_world_war_i(SortedIntervals) :- findall((Start,End),middle_eastern_theater_of_world_war_i(Start,End),UnsortedIntervals), predsort(compare_middle_eastern_theater_of_world_war_i,UnsortedIntervals,SortedIntervals).

generate_neg_middle_eastern_theater_of_world_war_i_aux() :- sort_middle_eastern_theater_of_world_war_i(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_middle_eastern_theater_of_world_war_i(NegatedIntervals).

neg_middle_eastern_theater_of_world_war_i_at_1926(Res) :- setof((Start,End),neg_middle_eastern_theater_of_world_war_i(Start,End),AllINtervals), checkvalidity(1926,AllINtervals,Res).

check_query() :- write('Query = neg_middle_eastern_theater_of_world_war_i_at_1926'), (neg_middle_eastern_theater_of_world_war_i_at_1926(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_middle_eastern_theater_of_world_war_i_aux().

