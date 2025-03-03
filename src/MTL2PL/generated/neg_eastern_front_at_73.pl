:- include('database.pl').
eastern_front(Start,End) :- begin('eastern_front',_,_,Start), end('eastern_front',_,_,End), Start=<End.

compare_eastern_front(Dir,eastern_front(Start1,_),eastern_front(Start2,_)) :- Start1=<Start2.

generate_neg_eastern_front([]).

generate_neg_eastern_front([(Start,End) | Tail]) :- assert(neg_eastern_front(Start,End)), generate_neg_eastern_front(Tail).

sort_eastern_front(SortedIntervals) :- findall((Start,End),eastern_front(Start,End),UnsortedIntervals), predsort(compare_eastern_front,UnsortedIntervals,SortedIntervals).

generate_neg_eastern_front_aux() :- sort_eastern_front(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_eastern_front(NegatedIntervals).

neg_eastern_front_at_73(Res) :- setof((Start,End),neg_eastern_front(Start,End),AllINtervals), checkvalidity(73,AllINtervals,Res).

check_query() :- write('Query = neg_eastern_front_at_73'), (neg_eastern_front_at_73(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_eastern_front_aux().

