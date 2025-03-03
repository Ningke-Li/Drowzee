:- include('database.pl').
tennis_at_the_2016_summer_olympics(Start,End) :- begin('tennis_at_the_2016_summer_olympics',_,_,Start), end('tennis_at_the_2016_summer_olympics',_,_,End), Start=<End.

compare_tennis_at_the_2016_summer_olympics(Dir,tennis_at_the_2016_summer_olympics(Start1,_),tennis_at_the_2016_summer_olympics(Start2,_)) :- Start1=<Start2.

generate_neg_tennis_at_the_2016_summer_olympics([]).

generate_neg_tennis_at_the_2016_summer_olympics([(Start,End) | Tail]) :- assert(neg_tennis_at_the_2016_summer_olympics(Start,End)), generate_neg_tennis_at_the_2016_summer_olympics(Tail).

sort_tennis_at_the_2016_summer_olympics(SortedIntervals) :- findall((Start,End),tennis_at_the_2016_summer_olympics(Start,End),UnsortedIntervals), predsort(compare_tennis_at_the_2016_summer_olympics,UnsortedIntervals,SortedIntervals).

generate_neg_tennis_at_the_2016_summer_olympics_aux() :- sort_tennis_at_the_2016_summer_olympics(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_tennis_at_the_2016_summer_olympics(NegatedIntervals).

neg_tennis_at_the_2016_summer_olympics_at_967(Res) :- setof((Start,End),neg_tennis_at_the_2016_summer_olympics(Start,End),AllINtervals), checkvalidity(967,AllINtervals,Res).

check_query() :- write('Query = neg_tennis_at_the_2016_summer_olympics_at_967'), (neg_tennis_at_the_2016_summer_olympics_at_967(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_tennis_at_the_2016_summer_olympics_aux().

