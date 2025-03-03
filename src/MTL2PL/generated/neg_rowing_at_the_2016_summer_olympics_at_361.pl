:- include('database.pl').
rowing_at_the_2016_summer_olympics(Start,End) :- begin('rowing_at_the_2016_summer_olympics',_,_,Start), end('rowing_at_the_2016_summer_olympics',_,_,End), Start=<End.

compare_rowing_at_the_2016_summer_olympics(Dir,rowing_at_the_2016_summer_olympics(Start1,_),rowing_at_the_2016_summer_olympics(Start2,_)) :- Start1=<Start2.

generate_neg_rowing_at_the_2016_summer_olympics([]).

generate_neg_rowing_at_the_2016_summer_olympics([(Start,End) | Tail]) :- assert(neg_rowing_at_the_2016_summer_olympics(Start,End)), generate_neg_rowing_at_the_2016_summer_olympics(Tail).

sort_rowing_at_the_2016_summer_olympics(SortedIntervals) :- findall((Start,End),rowing_at_the_2016_summer_olympics(Start,End),UnsortedIntervals), predsort(compare_rowing_at_the_2016_summer_olympics,UnsortedIntervals,SortedIntervals).

generate_neg_rowing_at_the_2016_summer_olympics_aux() :- sort_rowing_at_the_2016_summer_olympics(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_rowing_at_the_2016_summer_olympics(NegatedIntervals).

neg_rowing_at_the_2016_summer_olympics_at_361(Res) :- setof((Start,End),neg_rowing_at_the_2016_summer_olympics(Start,End),AllINtervals), checkvalidity(361,AllINtervals,Res).

check_query() :- write('Query = neg_rowing_at_the_2016_summer_olympics_at_361'), (neg_rowing_at_the_2016_summer_olympics_at_361(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_rowing_at_the_2016_summer_olympics_aux().

