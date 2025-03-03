:- include('database.pl').
italian_lira(Start,End) :- begin('italian_lira',_,_,Start), end('italian_lira',_,_,End), Start=<End.

compare_italian_lira(Dir,italian_lira(Start1,_),italian_lira(Start2,_)) :- Start1=<Start2.

generate_neg_italian_lira([]).

generate_neg_italian_lira([(Start,End) | Tail]) :- assert(neg_italian_lira(Start,End)), generate_neg_italian_lira(Tail).

sort_italian_lira(SortedIntervals) :- findall((Start,End),italian_lira(Start,End),UnsortedIntervals), predsort(compare_italian_lira,UnsortedIntervals,SortedIntervals).

generate_neg_italian_lira_aux() :- sort_italian_lira(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_italian_lira(NegatedIntervals).

neg_italian_lira_at_1613(Res) :- setof((Start,End),neg_italian_lira(Start,End),AllINtervals), checkvalidity(1613,AllINtervals,Res).

check_query() :- write('Query = neg_italian_lira_at_1613'), (neg_italian_lira_at_1613(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_italian_lira_aux().

