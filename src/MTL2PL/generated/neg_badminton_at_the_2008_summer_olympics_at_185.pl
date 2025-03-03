:- include('database.pl').
badminton_at_the_2008_summer_olympics(Start,End) :- begin('badminton_at_the_2008_summer_olympics',_,_,Start), end('badminton_at_the_2008_summer_olympics',_,_,End), Start=<End.

compare_badminton_at_the_2008_summer_olympics(Dir,badminton_at_the_2008_summer_olympics(Start1,_),badminton_at_the_2008_summer_olympics(Start2,_)) :- Start1=<Start2.

generate_neg_badminton_at_the_2008_summer_olympics([]).

generate_neg_badminton_at_the_2008_summer_olympics([(Start,End) | Tail]) :- assert(neg_badminton_at_the_2008_summer_olympics(Start,End)), generate_neg_badminton_at_the_2008_summer_olympics(Tail).

sort_badminton_at_the_2008_summer_olympics(SortedIntervals) :- findall((Start,End),badminton_at_the_2008_summer_olympics(Start,End),UnsortedIntervals), predsort(compare_badminton_at_the_2008_summer_olympics,UnsortedIntervals,SortedIntervals).

generate_neg_badminton_at_the_2008_summer_olympics_aux() :- sort_badminton_at_the_2008_summer_olympics(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_badminton_at_the_2008_summer_olympics(NegatedIntervals).

neg_badminton_at_the_2008_summer_olympics_at_185(Res) :- setof((Start,End),neg_badminton_at_the_2008_summer_olympics(Start,End),AllINtervals), checkvalidity(185,AllINtervals,Res).

check_query() :- write('Query = neg_badminton_at_the_2008_summer_olympics_at_185'), (neg_badminton_at_the_2008_summer_olympics_at_185(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_badminton_at_the_2008_summer_olympics_aux().

