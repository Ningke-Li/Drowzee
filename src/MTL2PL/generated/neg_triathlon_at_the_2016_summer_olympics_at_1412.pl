:- include('database.pl').
triathlon_at_the_2016_summer_olympics(Start,End) :- begin('triathlon_at_the_2016_summer_olympics',_,_,Start), end('triathlon_at_the_2016_summer_olympics',_,_,End), Start=<End.

compare_triathlon_at_the_2016_summer_olympics(Dir,triathlon_at_the_2016_summer_olympics(Start1,_),triathlon_at_the_2016_summer_olympics(Start2,_)) :- Start1=<Start2.

generate_neg_triathlon_at_the_2016_summer_olympics([]).

generate_neg_triathlon_at_the_2016_summer_olympics([(Start,End) | Tail]) :- assert(neg_triathlon_at_the_2016_summer_olympics(Start,End)), generate_neg_triathlon_at_the_2016_summer_olympics(Tail).

sort_triathlon_at_the_2016_summer_olympics(SortedIntervals) :- findall((Start,End),triathlon_at_the_2016_summer_olympics(Start,End),UnsortedIntervals), predsort(compare_triathlon_at_the_2016_summer_olympics,UnsortedIntervals,SortedIntervals).

generate_neg_triathlon_at_the_2016_summer_olympics_aux() :- sort_triathlon_at_the_2016_summer_olympics(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_triathlon_at_the_2016_summer_olympics(NegatedIntervals).

neg_triathlon_at_the_2016_summer_olympics_at_1412(Res) :- setof((Start,End),neg_triathlon_at_the_2016_summer_olympics(Start,End),AllINtervals), checkvalidity(1412,AllINtervals,Res).

check_query() :- write('Query = neg_triathlon_at_the_2016_summer_olympics_at_1412'), (neg_triathlon_at_the_2016_summer_olympics_at_1412(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_triathlon_at_the_2016_summer_olympics_aux().

