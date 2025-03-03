:- include('database.pl').
quantico(Start,End) :- begin('quantico',_,_,Start), end('quantico',_,_,End), Start=<End.

compare_quantico(Dir,quantico(Start1,_),quantico(Start2,_)) :- Start1=<Start2.

generate_neg_quantico([]).

generate_neg_quantico([(Start,End) | Tail]) :- assert(neg_quantico(Start,End)), generate_neg_quantico(Tail).

sort_quantico(SortedIntervals) :- findall((Start,End),quantico(Start,End),UnsortedIntervals), predsort(compare_quantico,UnsortedIntervals,SortedIntervals).

generate_neg_quantico_aux() :- sort_quantico(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_quantico(NegatedIntervals).

neg_quantico_at_1800(Res) :- setof((Start,End),neg_quantico(Start,End),AllINtervals), checkvalidity(1800,AllINtervals,Res).

check_query() :- write('Query = neg_quantico_at_1800'), (neg_quantico_at_1800(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_quantico_aux().

