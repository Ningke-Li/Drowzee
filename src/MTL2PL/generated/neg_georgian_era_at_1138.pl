:- include('database.pl').
georgian_era(Start,End) :- begin('georgian_era',_,_,Start), end('georgian_era',_,_,End), Start=<End.

compare_georgian_era(Dir,georgian_era(Start1,_),georgian_era(Start2,_)) :- Start1=<Start2.

generate_neg_georgian_era([]).

generate_neg_georgian_era([(Start,End) | Tail]) :- assert(neg_georgian_era(Start,End)), generate_neg_georgian_era(Tail).

sort_georgian_era(SortedIntervals) :- findall((Start,End),georgian_era(Start,End),UnsortedIntervals), predsort(compare_georgian_era,UnsortedIntervals,SortedIntervals).

generate_neg_georgian_era_aux() :- sort_georgian_era(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_georgian_era(NegatedIntervals).

neg_georgian_era_at_1138(Res) :- setof((Start,End),neg_georgian_era(Start,End),AllINtervals), checkvalidity(1138,AllINtervals,Res).

check_query() :- write('Query = neg_georgian_era_at_1138'), (neg_georgian_era_at_1138(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_georgian_era_aux().

