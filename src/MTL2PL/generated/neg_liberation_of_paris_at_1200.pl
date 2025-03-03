:- include('database.pl').
liberation_of_paris(Start,End) :- begin('liberation_of_paris',_,_,Start), end('liberation_of_paris',_,_,End), Start=<End.

compare_liberation_of_paris(Dir,liberation_of_paris(Start1,_),liberation_of_paris(Start2,_)) :- Start1=<Start2.

generate_neg_liberation_of_paris([]).

generate_neg_liberation_of_paris([(Start,End) | Tail]) :- assert(neg_liberation_of_paris(Start,End)), generate_neg_liberation_of_paris(Tail).

sort_liberation_of_paris(SortedIntervals) :- findall((Start,End),liberation_of_paris(Start,End),UnsortedIntervals), predsort(compare_liberation_of_paris,UnsortedIntervals,SortedIntervals).

generate_neg_liberation_of_paris_aux() :- sort_liberation_of_paris(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_liberation_of_paris(NegatedIntervals).

neg_liberation_of_paris_at_1200(Res) :- setof((Start,End),neg_liberation_of_paris(Start,End),AllINtervals), checkvalidity(1200,AllINtervals,Res).

check_query() :- write('Query = neg_liberation_of_paris_at_1200'), (neg_liberation_of_paris_at_1200(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_liberation_of_paris_aux().

