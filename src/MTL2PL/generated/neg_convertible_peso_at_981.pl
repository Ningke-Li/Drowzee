:- include('database.pl').
convertible_peso(Start,End) :- begin('convertible_peso',_,_,Start), end('convertible_peso',_,_,End), Start=<End.

compare_convertible_peso(Dir,convertible_peso(Start1,_),convertible_peso(Start2,_)) :- Start1=<Start2.

generate_neg_convertible_peso([]).

generate_neg_convertible_peso([(Start,End) | Tail]) :- assert(neg_convertible_peso(Start,End)), generate_neg_convertible_peso(Tail).

sort_convertible_peso(SortedIntervals) :- findall((Start,End),convertible_peso(Start,End),UnsortedIntervals), predsort(compare_convertible_peso,UnsortedIntervals,SortedIntervals).

generate_neg_convertible_peso_aux() :- sort_convertible_peso(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_convertible_peso(NegatedIntervals).

neg_convertible_peso_at_981(Res) :- setof((Start,End),neg_convertible_peso(Start,End),AllINtervals), checkvalidity(981,AllINtervals,Res).

check_query() :- write('Query = neg_convertible_peso_at_981'), (neg_convertible_peso_at_981(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_convertible_peso_aux().

