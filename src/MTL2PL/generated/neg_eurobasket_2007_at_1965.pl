:- include('database.pl').
eurobasket_2007(Start,End) :- begin('eurobasket_2007',_,_,Start), end('eurobasket_2007',_,_,End), Start=<End.

compare_eurobasket_2007(Dir,eurobasket_2007(Start1,_),eurobasket_2007(Start2,_)) :- Start1=<Start2.

generate_neg_eurobasket_2007([]).

generate_neg_eurobasket_2007([(Start,End) | Tail]) :- assert(neg_eurobasket_2007(Start,End)), generate_neg_eurobasket_2007(Tail).

sort_eurobasket_2007(SortedIntervals) :- findall((Start,End),eurobasket_2007(Start,End),UnsortedIntervals), predsort(compare_eurobasket_2007,UnsortedIntervals,SortedIntervals).

generate_neg_eurobasket_2007_aux() :- sort_eurobasket_2007(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_eurobasket_2007(NegatedIntervals).

neg_eurobasket_2007_at_1965(Res) :- setof((Start,End),neg_eurobasket_2007(Start,End),AllINtervals), checkvalidity(1965,AllINtervals,Res).

check_query() :- write('Query = neg_eurobasket_2007_at_1965'), (neg_eurobasket_2007_at_1965(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_eurobasket_2007_aux().

