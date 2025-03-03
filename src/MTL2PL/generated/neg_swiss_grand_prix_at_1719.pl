:- include('database.pl').
swiss_grand_prix(Start,End) :- begin('swiss_grand_prix',_,_,Start), end('swiss_grand_prix',_,_,End), Start=<End.

compare_swiss_grand_prix(Dir,swiss_grand_prix(Start1,_),swiss_grand_prix(Start2,_)) :- Start1=<Start2.

generate_neg_swiss_grand_prix([]).

generate_neg_swiss_grand_prix([(Start,End) | Tail]) :- assert(neg_swiss_grand_prix(Start,End)), generate_neg_swiss_grand_prix(Tail).

sort_swiss_grand_prix(SortedIntervals) :- findall((Start,End),swiss_grand_prix(Start,End),UnsortedIntervals), predsort(compare_swiss_grand_prix,UnsortedIntervals,SortedIntervals).

generate_neg_swiss_grand_prix_aux() :- sort_swiss_grand_prix(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_swiss_grand_prix(NegatedIntervals).

neg_swiss_grand_prix_at_1719(Res) :- setof((Start,End),neg_swiss_grand_prix(Start,End),AllINtervals), checkvalidity(1719,AllINtervals,Res).

check_query() :- write('Query = neg_swiss_grand_prix_at_1719'), (neg_swiss_grand_prix_at_1719(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_swiss_grand_prix_aux().

