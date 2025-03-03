:- include('database.pl').
the_shield(Start,End) :- begin('the_shield',_,_,Start), end('the_shield',_,_,End), Start=<End.

compare_the_shield(Dir,the_shield(Start1,_),the_shield(Start2,_)) :- Start1=<Start2.

generate_neg_the_shield([]).

generate_neg_the_shield([(Start,End) | Tail]) :- assert(neg_the_shield(Start,End)), generate_neg_the_shield(Tail).

sort_the_shield(SortedIntervals) :- findall((Start,End),the_shield(Start,End),UnsortedIntervals), predsort(compare_the_shield,UnsortedIntervals,SortedIntervals).

generate_neg_the_shield_aux() :- sort_the_shield(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_the_shield(NegatedIntervals).

neg_the_shield_at_276(Res) :- setof((Start,End),neg_the_shield(Start,End),AllINtervals), checkvalidity(276,AllINtervals,Res).

check_query() :- write('Query = neg_the_shield_at_276'), (neg_the_shield_at_276(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_the_shield_aux().

