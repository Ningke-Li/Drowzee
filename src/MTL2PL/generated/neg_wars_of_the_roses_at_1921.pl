:- include('database.pl').
wars_of_the_roses(Start,End) :- begin('wars_of_the_roses',_,_,Start), end('wars_of_the_roses',_,_,End), Start=<End.

compare_wars_of_the_roses(Dir,wars_of_the_roses(Start1,_),wars_of_the_roses(Start2,_)) :- Start1=<Start2.

generate_neg_wars_of_the_roses([]).

generate_neg_wars_of_the_roses([(Start,End) | Tail]) :- assert(neg_wars_of_the_roses(Start,End)), generate_neg_wars_of_the_roses(Tail).

sort_wars_of_the_roses(SortedIntervals) :- findall((Start,End),wars_of_the_roses(Start,End),UnsortedIntervals), predsort(compare_wars_of_the_roses,UnsortedIntervals,SortedIntervals).

generate_neg_wars_of_the_roses_aux() :- sort_wars_of_the_roses(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_wars_of_the_roses(NegatedIntervals).

neg_wars_of_the_roses_at_1921(Res) :- setof((Start,End),neg_wars_of_the_roses(Start,End),AllINtervals), checkvalidity(1921,AllINtervals,Res).

check_query() :- write('Query = neg_wars_of_the_roses_at_1921'), (neg_wars_of_the_roses_at_1921(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_wars_of_the_roses_aux().

