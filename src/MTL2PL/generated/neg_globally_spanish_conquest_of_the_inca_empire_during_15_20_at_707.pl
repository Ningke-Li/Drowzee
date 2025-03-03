:- include('database.pl').
spanish_conquest_of_the_inca_empire(Start,End) :- begin('spanish_conquest_of_the_inca_empire',_,_,Start), end('spanish_conquest_of_the_inca_empire',_,_,End), Start=<End.

globally_spanish_conquest_of_the_inca_empire_during_15_20(Start,End) :- spanish_conquest_of_the_inca_empire(Start1,End1), Start is (Start1-15), End is (End1-20), Start=<End.

compare_globally_spanish_conquest_of_the_inca_empire_during_15_20(Dir,globally_spanish_conquest_of_the_inca_empire_during_15_20(Start1,_),globally_spanish_conquest_of_the_inca_empire_during_15_20(Start2,_)) :- Start1=<Start2.

generate_neg_globally_spanish_conquest_of_the_inca_empire_during_15_20([]).

generate_neg_globally_spanish_conquest_of_the_inca_empire_during_15_20([(Start,End) | Tail]) :- assert(neg_globally_spanish_conquest_of_the_inca_empire_during_15_20(Start,End)), generate_neg_globally_spanish_conquest_of_the_inca_empire_during_15_20(Tail).

sort_globally_spanish_conquest_of_the_inca_empire_during_15_20(SortedIntervals) :- findall((Start,End),globally_spanish_conquest_of_the_inca_empire_during_15_20(Start,End),UnsortedIntervals), predsort(compare_globally_spanish_conquest_of_the_inca_empire_during_15_20,UnsortedIntervals,SortedIntervals).

generate_neg_globally_spanish_conquest_of_the_inca_empire_during_15_20_aux() :- sort_globally_spanish_conquest_of_the_inca_empire_during_15_20(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_spanish_conquest_of_the_inca_empire_during_15_20(NegatedIntervals).

neg_globally_spanish_conquest_of_the_inca_empire_during_15_20_at_707(Res) :- setof((Start,End),neg_globally_spanish_conquest_of_the_inca_empire_during_15_20(Start,End),AllINtervals), checkvalidity(707,AllINtervals,Res).

check_query() :- write('Query = neg_globally_spanish_conquest_of_the_inca_empire_during_15_20_at_707'), (neg_globally_spanish_conquest_of_the_inca_empire_during_15_20_at_707(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_spanish_conquest_of_the_inca_empire_during_15_20_aux().

