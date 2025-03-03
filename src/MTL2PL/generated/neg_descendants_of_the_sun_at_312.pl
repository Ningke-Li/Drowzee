:- include('database.pl').
descendants_of_the_sun(Start,End) :- begin('descendants_of_the_sun',_,_,Start), end('descendants_of_the_sun',_,_,End), Start=<End.

compare_descendants_of_the_sun(Dir,descendants_of_the_sun(Start1,_),descendants_of_the_sun(Start2,_)) :- Start1=<Start2.

generate_neg_descendants_of_the_sun([]).

generate_neg_descendants_of_the_sun([(Start,End) | Tail]) :- assert(neg_descendants_of_the_sun(Start,End)), generate_neg_descendants_of_the_sun(Tail).

sort_descendants_of_the_sun(SortedIntervals) :- findall((Start,End),descendants_of_the_sun(Start,End),UnsortedIntervals), predsort(compare_descendants_of_the_sun,UnsortedIntervals,SortedIntervals).

generate_neg_descendants_of_the_sun_aux() :- sort_descendants_of_the_sun(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_descendants_of_the_sun(NegatedIntervals).

neg_descendants_of_the_sun_at_312(Res) :- setof((Start,End),neg_descendants_of_the_sun(Start,End),AllINtervals), checkvalidity(312,AllINtervals,Res).

check_query() :- write('Query = neg_descendants_of_the_sun_at_312'), (neg_descendants_of_the_sun_at_312(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_descendants_of_the_sun_aux().

