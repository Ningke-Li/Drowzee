:- include('database.pl').
football_at_the_2012_summer_olympics(Start,End) :- begin('football_at_the_2012_summer_olympics',_,_,Start), end('football_at_the_2012_summer_olympics',_,_,End), Start=<End.

compare_football_at_the_2012_summer_olympics(Dir,football_at_the_2012_summer_olympics(Start1,_),football_at_the_2012_summer_olympics(Start2,_)) :- Start1=<Start2.

generate_neg_football_at_the_2012_summer_olympics([]).

generate_neg_football_at_the_2012_summer_olympics([(Start,End) | Tail]) :- assert(neg_football_at_the_2012_summer_olympics(Start,End)), generate_neg_football_at_the_2012_summer_olympics(Tail).

sort_football_at_the_2012_summer_olympics(SortedIntervals) :- findall((Start,End),football_at_the_2012_summer_olympics(Start,End),UnsortedIntervals), predsort(compare_football_at_the_2012_summer_olympics,UnsortedIntervals,SortedIntervals).

generate_neg_football_at_the_2012_summer_olympics_aux() :- sort_football_at_the_2012_summer_olympics(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_football_at_the_2012_summer_olympics(NegatedIntervals).

neg_football_at_the_2012_summer_olympics_at_143(Res) :- setof((Start,End),neg_football_at_the_2012_summer_olympics(Start,End),AllINtervals), checkvalidity(143,AllINtervals,Res).

check_query() :- write('Query = neg_football_at_the_2012_summer_olympics_at_143'), (neg_football_at_the_2012_summer_olympics_at_143(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_football_at_the_2012_summer_olympics_aux().

