:- include('database.pl').
californication(Start,End) :- begin('californication',_,_,Start), end('californication',_,_,End), Start=<End.

compare_californication(Dir,californication(Start1,_),californication(Start2,_)) :- Start1=<Start2.

generate_neg_californication([]).

generate_neg_californication([(Start,End) | Tail]) :- assert(neg_californication(Start,End)), generate_neg_californication(Tail).

sort_californication(SortedIntervals) :- findall((Start,End),californication(Start,End),UnsortedIntervals), predsort(compare_californication,UnsortedIntervals,SortedIntervals).

generate_neg_californication_aux() :- sort_californication(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_californication(NegatedIntervals).

neg_californication_at_1405(Res) :- setof((Start,End),neg_californication(Start,End),AllINtervals), checkvalidity(1405,AllINtervals,Res).

check_query() :- write('Query = neg_californication_at_1405'), (neg_californication_at_1405(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_californication_aux().

