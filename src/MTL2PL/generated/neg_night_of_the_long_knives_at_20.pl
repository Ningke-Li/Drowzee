:- include('database.pl').
night_of_the_long_knives(Start,End) :- begin('night_of_the_long_knives',_,_,Start), end('night_of_the_long_knives',_,_,End), Start=<End.

compare_night_of_the_long_knives(Dir,night_of_the_long_knives(Start1,_),night_of_the_long_knives(Start2,_)) :- Start1=<Start2.

generate_neg_night_of_the_long_knives([]).

generate_neg_night_of_the_long_knives([(Start,End) | Tail]) :- assert(neg_night_of_the_long_knives(Start,End)), generate_neg_night_of_the_long_knives(Tail).

sort_night_of_the_long_knives(SortedIntervals) :- findall((Start,End),night_of_the_long_knives(Start,End),UnsortedIntervals), predsort(compare_night_of_the_long_knives,UnsortedIntervals,SortedIntervals).

generate_neg_night_of_the_long_knives_aux() :- sort_night_of_the_long_knives(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_night_of_the_long_knives(NegatedIntervals).

neg_night_of_the_long_knives_at_20(Res) :- setof((Start,End),neg_night_of_the_long_knives(Start,End),AllINtervals), checkvalidity(20,AllINtervals,Res).

check_query() :- write('Query = neg_night_of_the_long_knives_at_20'), (neg_night_of_the_long_knives_at_20(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_night_of_the_long_knives_aux().

