:- include('database.pl').
shooting_at_the_2016_summer_olympics(Start,End) :- begin('shooting_at_the_2016_summer_olympics',_,_,Start), end('shooting_at_the_2016_summer_olympics',_,_,End), Start=<End.

compare_shooting_at_the_2016_summer_olympics(Dir,shooting_at_the_2016_summer_olympics(Start1,_),shooting_at_the_2016_summer_olympics(Start2,_)) :- Start1=<Start2.

generate_neg_shooting_at_the_2016_summer_olympics([]).

generate_neg_shooting_at_the_2016_summer_olympics([(Start,End) | Tail]) :- assert(neg_shooting_at_the_2016_summer_olympics(Start,End)), generate_neg_shooting_at_the_2016_summer_olympics(Tail).

sort_shooting_at_the_2016_summer_olympics(SortedIntervals) :- findall((Start,End),shooting_at_the_2016_summer_olympics(Start,End),UnsortedIntervals), predsort(compare_shooting_at_the_2016_summer_olympics,UnsortedIntervals,SortedIntervals).

generate_neg_shooting_at_the_2016_summer_olympics_aux() :- sort_shooting_at_the_2016_summer_olympics(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_shooting_at_the_2016_summer_olympics(NegatedIntervals).

neg_shooting_at_the_2016_summer_olympics_at_1999(Res) :- setof((Start,End),neg_shooting_at_the_2016_summer_olympics(Start,End),AllINtervals), checkvalidity(1999,AllINtervals,Res).

check_query() :- write('Query = neg_shooting_at_the_2016_summer_olympics_at_1999'), (neg_shooting_at_the_2016_summer_olympics_at_1999(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_shooting_at_the_2016_summer_olympics_aux().

