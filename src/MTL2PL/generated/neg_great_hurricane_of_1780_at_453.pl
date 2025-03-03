:- include('database.pl').
great_hurricane_of_1780(Start,End) :- begin('great_hurricane_of_1780',_,_,Start), end('great_hurricane_of_1780',_,_,End), Start=<End.

compare_great_hurricane_of_1780(Dir,great_hurricane_of_1780(Start1,_),great_hurricane_of_1780(Start2,_)) :- Start1=<Start2.

generate_neg_great_hurricane_of_1780([]).

generate_neg_great_hurricane_of_1780([(Start,End) | Tail]) :- assert(neg_great_hurricane_of_1780(Start,End)), generate_neg_great_hurricane_of_1780(Tail).

sort_great_hurricane_of_1780(SortedIntervals) :- findall((Start,End),great_hurricane_of_1780(Start,End),UnsortedIntervals), predsort(compare_great_hurricane_of_1780,UnsortedIntervals,SortedIntervals).

generate_neg_great_hurricane_of_1780_aux() :- sort_great_hurricane_of_1780(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_great_hurricane_of_1780(NegatedIntervals).

neg_great_hurricane_of_1780_at_453(Res) :- setof((Start,End),neg_great_hurricane_of_1780(Start,End),AllINtervals), checkvalidity(453,AllINtervals,Res).

check_query() :- write('Query = neg_great_hurricane_of_1780_at_453'), (neg_great_hurricane_of_1780_at_453(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_great_hurricane_of_1780_aux().

