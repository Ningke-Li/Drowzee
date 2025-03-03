:- include('database.pl').
star_vs__the_forces_of_evil(Start,End) :- begin('star_vs__the_forces_of_evil',_,_,Start), end('star_vs__the_forces_of_evil',_,_,End), Start=<End.

finally_star_vs__the_forces_of_evil_during_6_18(Start,End) :- star_vs__the_forces_of_evil(Start1,End1), (Start1-18)=<(End1-6), Start is (Start1-18), End is (End1-6), Start=<End.

compare_finally_star_vs__the_forces_of_evil_during_6_18(Dir,finally_star_vs__the_forces_of_evil_during_6_18(Start1,_),finally_star_vs__the_forces_of_evil_during_6_18(Start2,_)) :- Start1=<Start2.

generate_neg_finally_star_vs__the_forces_of_evil_during_6_18([]).

generate_neg_finally_star_vs__the_forces_of_evil_during_6_18([(Start,End) | Tail]) :- assert(neg_finally_star_vs__the_forces_of_evil_during_6_18(Start,End)), generate_neg_finally_star_vs__the_forces_of_evil_during_6_18(Tail).

sort_finally_star_vs__the_forces_of_evil_during_6_18(SortedIntervals) :- findall((Start,End),finally_star_vs__the_forces_of_evil_during_6_18(Start,End),UnsortedIntervals), predsort(compare_finally_star_vs__the_forces_of_evil_during_6_18,UnsortedIntervals,SortedIntervals).

generate_neg_finally_star_vs__the_forces_of_evil_during_6_18_aux() :- sort_finally_star_vs__the_forces_of_evil_during_6_18(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_star_vs__the_forces_of_evil_during_6_18(NegatedIntervals).

neg_finally_star_vs__the_forces_of_evil_during_6_18_at_557(Res) :- setof((Start,End),neg_finally_star_vs__the_forces_of_evil_during_6_18(Start,End),AllINtervals), checkvalidity(557,AllINtervals,Res).

check_query() :- write('Query = neg_finally_star_vs__the_forces_of_evil_during_6_18_at_557'), (neg_finally_star_vs__the_forces_of_evil_during_6_18_at_557(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_star_vs__the_forces_of_evil_during_6_18_aux().

