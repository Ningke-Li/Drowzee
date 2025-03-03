:- include('database.pl').
peep_and_the_big_wide_world(Start,End) :- begin('peep_and_the_big_wide_world',_,_,Start), end('peep_and_the_big_wide_world',_,_,End), Start=<End.

globally_peep_and_the_big_wide_world_during_5_6(Start,End) :- peep_and_the_big_wide_world(Start1,End1), Start is (Start1-5), End is (End1-6), Start=<End.

compare_globally_peep_and_the_big_wide_world_during_5_6(Dir,globally_peep_and_the_big_wide_world_during_5_6(Start1,_),globally_peep_and_the_big_wide_world_during_5_6(Start2,_)) :- Start1=<Start2.

generate_neg_globally_peep_and_the_big_wide_world_during_5_6([]).

generate_neg_globally_peep_and_the_big_wide_world_during_5_6([(Start,End) | Tail]) :- assert(neg_globally_peep_and_the_big_wide_world_during_5_6(Start,End)), generate_neg_globally_peep_and_the_big_wide_world_during_5_6(Tail).

sort_globally_peep_and_the_big_wide_world_during_5_6(SortedIntervals) :- findall((Start,End),globally_peep_and_the_big_wide_world_during_5_6(Start,End),UnsortedIntervals), predsort(compare_globally_peep_and_the_big_wide_world_during_5_6,UnsortedIntervals,SortedIntervals).

generate_neg_globally_peep_and_the_big_wide_world_during_5_6_aux() :- sort_globally_peep_and_the_big_wide_world_during_5_6(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_peep_and_the_big_wide_world_during_5_6(NegatedIntervals).

neg_globally_peep_and_the_big_wide_world_during_5_6_at_1994(Res) :- setof((Start,End),neg_globally_peep_and_the_big_wide_world_during_5_6(Start,End),AllINtervals), checkvalidity(1994,AllINtervals,Res).

check_query() :- write('Query = neg_globally_peep_and_the_big_wide_world_during_5_6_at_1994'), (neg_globally_peep_and_the_big_wide_world_during_5_6_at_1994(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_peep_and_the_big_wide_world_during_5_6_aux().

