:- include('database.pl').
brutalist_architecture(Start,End) :- begin('brutalist_architecture',_,_,Start), end('brutalist_architecture',_,_,End), Start=<End.

compare_brutalist_architecture(Dir,brutalist_architecture(Start1,_),brutalist_architecture(Start2,_)) :- Start1=<Start2.

generate_neg_brutalist_architecture([]).

generate_neg_brutalist_architecture([(Start,End) | Tail]) :- assert(neg_brutalist_architecture(Start,End)), generate_neg_brutalist_architecture(Tail).

sort_brutalist_architecture(SortedIntervals) :- findall((Start,End),brutalist_architecture(Start,End),UnsortedIntervals), predsort(compare_brutalist_architecture,UnsortedIntervals,SortedIntervals).

generate_neg_brutalist_architecture_aux() :- sort_brutalist_architecture(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_brutalist_architecture(NegatedIntervals).

neg_brutalist_architecture_at_1795(Res) :- setof((Start,End),neg_brutalist_architecture(Start,End),AllINtervals), checkvalidity(1795,AllINtervals,Res).

check_query() :- write('Query = neg_brutalist_architecture_at_1795'), (neg_brutalist_architecture_at_1795(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_brutalist_architecture_aux().

