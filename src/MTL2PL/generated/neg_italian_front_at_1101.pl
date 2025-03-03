:- include('database.pl').
italian_front(Start,End) :- begin('italian_front',_,_,Start), end('italian_front',_,_,End), Start=<End.

compare_italian_front(Dir,italian_front(Start1,_),italian_front(Start2,_)) :- Start1=<Start2.

generate_neg_italian_front([]).

generate_neg_italian_front([(Start,End) | Tail]) :- assert(neg_italian_front(Start,End)), generate_neg_italian_front(Tail).

sort_italian_front(SortedIntervals) :- findall((Start,End),italian_front(Start,End),UnsortedIntervals), predsort(compare_italian_front,UnsortedIntervals,SortedIntervals).

generate_neg_italian_front_aux() :- sort_italian_front(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_italian_front(NegatedIntervals).

neg_italian_front_at_1101(Res) :- setof((Start,End),neg_italian_front(Start,End),AllINtervals), checkvalidity(1101,AllINtervals,Res).

check_query() :- write('Query = neg_italian_front_at_1101'), (neg_italian_front_at_1101(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_italian_front_aux().

