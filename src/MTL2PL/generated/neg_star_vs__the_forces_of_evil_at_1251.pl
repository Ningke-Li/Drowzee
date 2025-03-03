:- include('database.pl').
star_vs__the_forces_of_evil(Start,End) :- begin('star_vs__the_forces_of_evil',_,_,Start), end('star_vs__the_forces_of_evil',_,_,End), Start=<End.

compare_star_vs__the_forces_of_evil(Dir,star_vs__the_forces_of_evil(Start1,_),star_vs__the_forces_of_evil(Start2,_)) :- Start1=<Start2.

generate_neg_star_vs__the_forces_of_evil([]).

generate_neg_star_vs__the_forces_of_evil([(Start,End) | Tail]) :- assert(neg_star_vs__the_forces_of_evil(Start,End)), generate_neg_star_vs__the_forces_of_evil(Tail).

sort_star_vs__the_forces_of_evil(SortedIntervals) :- findall((Start,End),star_vs__the_forces_of_evil(Start,End),UnsortedIntervals), predsort(compare_star_vs__the_forces_of_evil,UnsortedIntervals,SortedIntervals).

generate_neg_star_vs__the_forces_of_evil_aux() :- sort_star_vs__the_forces_of_evil(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_star_vs__the_forces_of_evil(NegatedIntervals).

neg_star_vs__the_forces_of_evil_at_1251(Res) :- setof((Start,End),neg_star_vs__the_forces_of_evil(Start,End),AllINtervals), checkvalidity(1251,AllINtervals,Res).

check_query() :- write('Query = neg_star_vs__the_forces_of_evil_at_1251'), (neg_star_vs__the_forces_of_evil_at_1251(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_star_vs__the_forces_of_evil_aux().

