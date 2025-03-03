:- include('database.pl').
austro_hungarian_krone(Start,End) :- begin('austro_hungarian_krone',_,_,Start), end('austro_hungarian_krone',_,_,End), Start=<End.

compare_austro_hungarian_krone(Dir,austro_hungarian_krone(Start1,_),austro_hungarian_krone(Start2,_)) :- Start1=<Start2.

generate_neg_austro_hungarian_krone([]).

generate_neg_austro_hungarian_krone([(Start,End) | Tail]) :- assert(neg_austro_hungarian_krone(Start,End)), generate_neg_austro_hungarian_krone(Tail).

sort_austro_hungarian_krone(SortedIntervals) :- findall((Start,End),austro_hungarian_krone(Start,End),UnsortedIntervals), predsort(compare_austro_hungarian_krone,UnsortedIntervals,SortedIntervals).

generate_neg_austro_hungarian_krone_aux() :- sort_austro_hungarian_krone(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_austro_hungarian_krone(NegatedIntervals).

neg_austro_hungarian_krone_at_234(Res) :- setof((Start,End),neg_austro_hungarian_krone(Start,End),AllINtervals), checkvalidity(234,AllINtervals,Res).

check_query() :- write('Query = neg_austro_hungarian_krone_at_234'), (neg_austro_hungarian_krone_at_234(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_austro_hungarian_krone_aux().

