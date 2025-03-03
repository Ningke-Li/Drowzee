:- include('database.pl').
july_2014(Start,End) :- begin('july_2014',_,_,Start), end('july_2014',_,_,End), Start=<End.

compare_july_2014(Dir,july_2014(Start1,_),july_2014(Start2,_)) :- Start1=<Start2.

generate_neg_july_2014([]).

generate_neg_july_2014([(Start,End) | Tail]) :- assert(neg_july_2014(Start,End)), generate_neg_july_2014(Tail).

sort_july_2014(SortedIntervals) :- findall((Start,End),july_2014(Start,End),UnsortedIntervals), predsort(compare_july_2014,UnsortedIntervals,SortedIntervals).

generate_neg_july_2014_aux() :- sort_july_2014(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_july_2014(NegatedIntervals).

neg_july_2014_at_1069(Res) :- setof((Start,End),neg_july_2014(Start,End),AllINtervals), checkvalidity(1069,AllINtervals,Res).

check_query() :- write('Query = neg_july_2014_at_1069'), (neg_july_2014_at_1069(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_july_2014_aux().

