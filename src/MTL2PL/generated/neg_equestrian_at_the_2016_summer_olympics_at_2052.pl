:- include('database.pl').
equestrian_at_the_2016_summer_olympics(Start,End) :- begin('equestrian_at_the_2016_summer_olympics',_,_,Start), end('equestrian_at_the_2016_summer_olympics',_,_,End), Start=<End.

compare_equestrian_at_the_2016_summer_olympics(Dir,equestrian_at_the_2016_summer_olympics(Start1,_),equestrian_at_the_2016_summer_olympics(Start2,_)) :- Start1=<Start2.

generate_neg_equestrian_at_the_2016_summer_olympics([]).

generate_neg_equestrian_at_the_2016_summer_olympics([(Start,End) | Tail]) :- assert(neg_equestrian_at_the_2016_summer_olympics(Start,End)), generate_neg_equestrian_at_the_2016_summer_olympics(Tail).

sort_equestrian_at_the_2016_summer_olympics(SortedIntervals) :- findall((Start,End),equestrian_at_the_2016_summer_olympics(Start,End),UnsortedIntervals), predsort(compare_equestrian_at_the_2016_summer_olympics,UnsortedIntervals,SortedIntervals).

generate_neg_equestrian_at_the_2016_summer_olympics_aux() :- sort_equestrian_at_the_2016_summer_olympics(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_equestrian_at_the_2016_summer_olympics(NegatedIntervals).

neg_equestrian_at_the_2016_summer_olympics_at_2052(Res) :- setof((Start,End),neg_equestrian_at_the_2016_summer_olympics(Start,End),AllINtervals), checkvalidity(2052,AllINtervals,Res).

check_query() :- write('Query = neg_equestrian_at_the_2016_summer_olympics_at_2052'), (neg_equestrian_at_the_2016_summer_olympics_at_2052(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_equestrian_at_the_2016_summer_olympics_aux().

