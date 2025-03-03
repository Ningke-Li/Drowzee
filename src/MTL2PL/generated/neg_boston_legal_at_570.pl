:- include('database.pl').
boston_legal(Start,End) :- begin('boston_legal',_,_,Start), end('boston_legal',_,_,End), Start=<End.

compare_boston_legal(Dir,boston_legal(Start1,_),boston_legal(Start2,_)) :- Start1=<Start2.

generate_neg_boston_legal([]).

generate_neg_boston_legal([(Start,End) | Tail]) :- assert(neg_boston_legal(Start,End)), generate_neg_boston_legal(Tail).

sort_boston_legal(SortedIntervals) :- findall((Start,End),boston_legal(Start,End),UnsortedIntervals), predsort(compare_boston_legal,UnsortedIntervals,SortedIntervals).

generate_neg_boston_legal_aux() :- sort_boston_legal(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_boston_legal(NegatedIntervals).

neg_boston_legal_at_570(Res) :- setof((Start,End),neg_boston_legal(Start,End),AllINtervals), checkvalidity(570,AllINtervals,Res).

check_query() :- write('Query = neg_boston_legal_at_570'), (neg_boston_legal_at_570(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_boston_legal_aux().

