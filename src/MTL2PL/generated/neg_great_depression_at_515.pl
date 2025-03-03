:- include('database.pl').
great_depression(Start,End) :- begin('great_depression',_,_,Start), end('great_depression',_,_,End), Start=<End.

compare_great_depression(Dir,great_depression(Start1,_),great_depression(Start2,_)) :- Start1=<Start2.

generate_neg_great_depression([]).

generate_neg_great_depression([(Start,End) | Tail]) :- assert(neg_great_depression(Start,End)), generate_neg_great_depression(Tail).

sort_great_depression(SortedIntervals) :- findall((Start,End),great_depression(Start,End),UnsortedIntervals), predsort(compare_great_depression,UnsortedIntervals,SortedIntervals).

generate_neg_great_depression_aux() :- sort_great_depression(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_great_depression(NegatedIntervals).

neg_great_depression_at_515(Res) :- setof((Start,End),neg_great_depression(Start,End),AllINtervals), checkvalidity(515,AllINtervals,Res).

check_query() :- write('Query = neg_great_depression_at_515'), (neg_great_depression_at_515(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_great_depression_aux().

