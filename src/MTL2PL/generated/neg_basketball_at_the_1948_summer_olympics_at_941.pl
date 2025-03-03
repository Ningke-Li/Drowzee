:- include('database.pl').
basketball_at_the_1948_summer_olympics(Start,End) :- begin('basketball_at_the_1948_summer_olympics',_,_,Start), end('basketball_at_the_1948_summer_olympics',_,_,End), Start=<End.

compare_basketball_at_the_1948_summer_olympics(Dir,basketball_at_the_1948_summer_olympics(Start1,_),basketball_at_the_1948_summer_olympics(Start2,_)) :- Start1=<Start2.

generate_neg_basketball_at_the_1948_summer_olympics([]).

generate_neg_basketball_at_the_1948_summer_olympics([(Start,End) | Tail]) :- assert(neg_basketball_at_the_1948_summer_olympics(Start,End)), generate_neg_basketball_at_the_1948_summer_olympics(Tail).

sort_basketball_at_the_1948_summer_olympics(SortedIntervals) :- findall((Start,End),basketball_at_the_1948_summer_olympics(Start,End),UnsortedIntervals), predsort(compare_basketball_at_the_1948_summer_olympics,UnsortedIntervals,SortedIntervals).

generate_neg_basketball_at_the_1948_summer_olympics_aux() :- sort_basketball_at_the_1948_summer_olympics(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_basketball_at_the_1948_summer_olympics(NegatedIntervals).

neg_basketball_at_the_1948_summer_olympics_at_941(Res) :- setof((Start,End),neg_basketball_at_the_1948_summer_olympics(Start,End),AllINtervals), checkvalidity(941,AllINtervals,Res).

check_query() :- write('Query = neg_basketball_at_the_1948_summer_olympics_at_941'), (neg_basketball_at_the_1948_summer_olympics_at_941(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_basketball_at_the_1948_summer_olympics_aux().

