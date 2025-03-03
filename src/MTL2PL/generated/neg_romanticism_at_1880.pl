:- include('database.pl').
romanticism(Start,End) :- begin('romanticism',_,_,Start), end('romanticism',_,_,End), Start=<End.

compare_romanticism(Dir,romanticism(Start1,_),romanticism(Start2,_)) :- Start1=<Start2.

generate_neg_romanticism([]).

generate_neg_romanticism([(Start,End) | Tail]) :- assert(neg_romanticism(Start,End)), generate_neg_romanticism(Tail).

sort_romanticism(SortedIntervals) :- findall((Start,End),romanticism(Start,End),UnsortedIntervals), predsort(compare_romanticism,UnsortedIntervals,SortedIntervals).

generate_neg_romanticism_aux() :- sort_romanticism(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_romanticism(NegatedIntervals).

neg_romanticism_at_1880(Res) :- setof((Start,End),neg_romanticism(Start,End),AllINtervals), checkvalidity(1880,AllINtervals,Res).

check_query() :- write('Query = neg_romanticism_at_1880'), (neg_romanticism_at_1880(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_romanticism_aux().

