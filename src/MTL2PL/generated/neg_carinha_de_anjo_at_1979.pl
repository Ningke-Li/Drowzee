:- include('database.pl').
carinha_de_anjo(Start,End) :- begin('carinha_de_anjo',_,_,Start), end('carinha_de_anjo',_,_,End), Start=<End.

compare_carinha_de_anjo(Dir,carinha_de_anjo(Start1,_),carinha_de_anjo(Start2,_)) :- Start1=<Start2.

generate_neg_carinha_de_anjo([]).

generate_neg_carinha_de_anjo([(Start,End) | Tail]) :- assert(neg_carinha_de_anjo(Start,End)), generate_neg_carinha_de_anjo(Tail).

sort_carinha_de_anjo(SortedIntervals) :- findall((Start,End),carinha_de_anjo(Start,End),UnsortedIntervals), predsort(compare_carinha_de_anjo,UnsortedIntervals,SortedIntervals).

generate_neg_carinha_de_anjo_aux() :- sort_carinha_de_anjo(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_carinha_de_anjo(NegatedIntervals).

neg_carinha_de_anjo_at_1979(Res) :- setof((Start,End),neg_carinha_de_anjo(Start,End),AllINtervals), checkvalidity(1979,AllINtervals,Res).

check_query() :- write('Query = neg_carinha_de_anjo_at_1979'), (neg_carinha_de_anjo_at_1979(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_carinha_de_anjo_aux().

