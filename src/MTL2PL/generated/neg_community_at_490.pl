:- include('database.pl').
community(Start,End) :- begin('community',_,_,Start), end('community',_,_,End), Start=<End.

compare_community(Dir,community(Start1,_),community(Start2,_)) :- Start1=<Start2.

generate_neg_community([]).

generate_neg_community([(Start,End) | Tail]) :- assert(neg_community(Start,End)), generate_neg_community(Tail).

sort_community(SortedIntervals) :- findall((Start,End),community(Start,End),UnsortedIntervals), predsort(compare_community,UnsortedIntervals,SortedIntervals).

generate_neg_community_aux() :- sort_community(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_community(NegatedIntervals).

neg_community_at_490(Res) :- setof((Start,End),neg_community(Start,End),AllINtervals), checkvalidity(490,AllINtervals,Res).

check_query() :- write('Query = neg_community_at_490'), (neg_community_at_490(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_community_aux().

