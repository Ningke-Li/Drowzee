:- include('database.pl').
handball_at_the_1936_summer_olympics(Start,End) :- begin('handball_at_the_1936_summer_olympics',_,_,Start), end('handball_at_the_1936_summer_olympics',_,_,End), Start=<End.

compare_handball_at_the_1936_summer_olympics(Dir,handball_at_the_1936_summer_olympics(Start1,_),handball_at_the_1936_summer_olympics(Start2,_)) :- Start1=<Start2.

generate_neg_handball_at_the_1936_summer_olympics([]).

generate_neg_handball_at_the_1936_summer_olympics([(Start,End) | Tail]) :- assert(neg_handball_at_the_1936_summer_olympics(Start,End)), generate_neg_handball_at_the_1936_summer_olympics(Tail).

sort_handball_at_the_1936_summer_olympics(SortedIntervals) :- findall((Start,End),handball_at_the_1936_summer_olympics(Start,End),UnsortedIntervals), predsort(compare_handball_at_the_1936_summer_olympics,UnsortedIntervals,SortedIntervals).

generate_neg_handball_at_the_1936_summer_olympics_aux() :- sort_handball_at_the_1936_summer_olympics(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_handball_at_the_1936_summer_olympics(NegatedIntervals).

neg_handball_at_the_1936_summer_olympics_at_1523(Res) :- setof((Start,End),neg_handball_at_the_1936_summer_olympics(Start,End),AllINtervals), checkvalidity(1523,AllINtervals,Res).

check_query() :- write('Query = neg_handball_at_the_1936_summer_olympics_at_1523'), (neg_handball_at_the_1936_summer_olympics_at_1523(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_handball_at_the_1936_summer_olympics_aux().

