:- include('database.pl').
european_theater_of_world_war_ii(Start,End) :- begin('european_theater_of_world_war_ii',_,_,Start), end('european_theater_of_world_war_ii',_,_,End), Start=<End.

finally_european_theater_of_world_war_ii_during_3_13(Start,End) :- european_theater_of_world_war_ii(Start1,End1), (Start1-13)=<(End1-3), Start is (Start1-13), End is (End1-3), Start=<End.

compare_finally_european_theater_of_world_war_ii_during_3_13(Dir,finally_european_theater_of_world_war_ii_during_3_13(Start1,_),finally_european_theater_of_world_war_ii_during_3_13(Start2,_)) :- Start1=<Start2.

generate_neg_finally_european_theater_of_world_war_ii_during_3_13([]).

generate_neg_finally_european_theater_of_world_war_ii_during_3_13([(Start,End) | Tail]) :- assert(neg_finally_european_theater_of_world_war_ii_during_3_13(Start,End)), generate_neg_finally_european_theater_of_world_war_ii_during_3_13(Tail).

sort_finally_european_theater_of_world_war_ii_during_3_13(SortedIntervals) :- findall((Start,End),finally_european_theater_of_world_war_ii_during_3_13(Start,End),UnsortedIntervals), predsort(compare_finally_european_theater_of_world_war_ii_during_3_13,UnsortedIntervals,SortedIntervals).

generate_neg_finally_european_theater_of_world_war_ii_during_3_13_aux() :- sort_finally_european_theater_of_world_war_ii_during_3_13(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_european_theater_of_world_war_ii_during_3_13(NegatedIntervals).

neg_finally_european_theater_of_world_war_ii_during_3_13_at_1481(Res) :- setof((Start,End),neg_finally_european_theater_of_world_war_ii_during_3_13(Start,End),AllINtervals), checkvalidity(1481,AllINtervals,Res).

check_query() :- write('Query = neg_finally_european_theater_of_world_war_ii_during_3_13_at_1481'), (neg_finally_european_theater_of_world_war_ii_during_3_13_at_1481(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_european_theater_of_world_war_ii_during_3_13_aux().

