:- include('database.pl').
december_2013(Start,End) :- begin('december_2013',_,_,Start), end('december_2013',_,_,End), Start=<End.

compare_december_2013(Dir,december_2013(Start1,_),december_2013(Start2,_)) :- Start1=<Start2.

generate_neg_december_2013([]).

generate_neg_december_2013([(Start,End) | Tail]) :- assert(neg_december_2013(Start,End)), generate_neg_december_2013(Tail).

sort_december_2013(SortedIntervals) :- findall((Start,End),december_2013(Start,End),UnsortedIntervals), predsort(compare_december_2013,UnsortedIntervals,SortedIntervals).

generate_neg_december_2013_aux() :- sort_december_2013(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_december_2013(NegatedIntervals).

neg_december_2013_at_132(Res) :- setof((Start,End),neg_december_2013(Start,End),AllINtervals), checkvalidity(132,AllINtervals,Res).

check_query() :- write('Query = neg_december_2013_at_132'), (neg_december_2013_at_132(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_december_2013_aux().

