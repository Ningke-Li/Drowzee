:- include('database.pl').
icarly(Start,End) :- begin('icarly',_,_,Start), end('icarly',_,_,End), Start=<End.

compare_icarly(Dir,icarly(Start1,_),icarly(Start2,_)) :- Start1=<Start2.

generate_neg_icarly([]).

generate_neg_icarly([(Start,End) | Tail]) :- assert(neg_icarly(Start,End)), generate_neg_icarly(Tail).

sort_icarly(SortedIntervals) :- findall((Start,End),icarly(Start,End),UnsortedIntervals), predsort(compare_icarly,UnsortedIntervals,SortedIntervals).

generate_neg_icarly_aux() :- sort_icarly(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_icarly(NegatedIntervals).

neg_icarly_at_200(Res) :- setof((Start,End),neg_icarly(Start,End),AllINtervals), checkvalidity(200,AllINtervals,Res).

check_query() :- write('Query = neg_icarly_at_200'), (neg_icarly_at_200(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_icarly_aux().

