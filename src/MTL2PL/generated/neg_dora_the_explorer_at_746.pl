:- include('database.pl').
dora_the_explorer(Start,End) :- begin('dora_the_explorer',_,_,Start), end('dora_the_explorer',_,_,End), Start=<End.

compare_dora_the_explorer(Dir,dora_the_explorer(Start1,_),dora_the_explorer(Start2,_)) :- Start1=<Start2.

generate_neg_dora_the_explorer([]).

generate_neg_dora_the_explorer([(Start,End) | Tail]) :- assert(neg_dora_the_explorer(Start,End)), generate_neg_dora_the_explorer(Tail).

sort_dora_the_explorer(SortedIntervals) :- findall((Start,End),dora_the_explorer(Start,End),UnsortedIntervals), predsort(compare_dora_the_explorer,UnsortedIntervals,SortedIntervals).

generate_neg_dora_the_explorer_aux() :- sort_dora_the_explorer(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_dora_the_explorer(NegatedIntervals).

neg_dora_the_explorer_at_746(Res) :- setof((Start,End),neg_dora_the_explorer(Start,End),AllINtervals), checkvalidity(746,AllINtervals,Res).

check_query() :- write('Query = neg_dora_the_explorer_at_746'), (neg_dora_the_explorer_at_746(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_dora_the_explorer_aux().

