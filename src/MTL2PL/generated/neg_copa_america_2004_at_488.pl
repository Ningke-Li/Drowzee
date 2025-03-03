:- include('database.pl').
copa_america_2004(Start,End) :- begin('copa_america_2004',_,_,Start), end('copa_america_2004',_,_,End), Start=<End.

compare_copa_america_2004(Dir,copa_america_2004(Start1,_),copa_america_2004(Start2,_)) :- Start1=<Start2.

generate_neg_copa_america_2004([]).

generate_neg_copa_america_2004([(Start,End) | Tail]) :- assert(neg_copa_america_2004(Start,End)), generate_neg_copa_america_2004(Tail).

sort_copa_america_2004(SortedIntervals) :- findall((Start,End),copa_america_2004(Start,End),UnsortedIntervals), predsort(compare_copa_america_2004,UnsortedIntervals,SortedIntervals).

generate_neg_copa_america_2004_aux() :- sort_copa_america_2004(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_copa_america_2004(NegatedIntervals).

neg_copa_america_2004_at_488(Res) :- setof((Start,End),neg_copa_america_2004(Start,End),AllINtervals), checkvalidity(488,AllINtervals,Res).

check_query() :- write('Query = neg_copa_america_2004_at_488'), (neg_copa_america_2004_at_488(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_copa_america_2004_aux().

