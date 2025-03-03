:- include('database.pl').
gotham(Start,End) :- begin('gotham',_,_,Start), end('gotham',_,_,End), Start=<End.

compare_gotham(Dir,gotham(Start1,_),gotham(Start2,_)) :- Start1=<Start2.

generate_neg_gotham([]).

generate_neg_gotham([(Start,End) | Tail]) :- assert(neg_gotham(Start,End)), generate_neg_gotham(Tail).

sort_gotham(SortedIntervals) :- findall((Start,End),gotham(Start,End),UnsortedIntervals), predsort(compare_gotham,UnsortedIntervals,SortedIntervals).

generate_neg_gotham_aux() :- sort_gotham(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_gotham(NegatedIntervals).

neg_gotham_at_921(Res) :- setof((Start,End),neg_gotham(Start,End),AllINtervals), checkvalidity(921,AllINtervals,Res).

check_query() :- write('Query = neg_gotham_at_921'), (neg_gotham_at_921(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_gotham_aux().

