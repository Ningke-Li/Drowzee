:- include('database.pl').
renaissance(Start,End) :- begin('renaissance',_,_,Start), end('renaissance',_,_,End), Start=<End.

compare_renaissance(Dir,renaissance(Start1,_),renaissance(Start2,_)) :- Start1=<Start2.

generate_neg_renaissance([]).

generate_neg_renaissance([(Start,End) | Tail]) :- assert(neg_renaissance(Start,End)), generate_neg_renaissance(Tail).

sort_renaissance(SortedIntervals) :- findall((Start,End),renaissance(Start,End),UnsortedIntervals), predsort(compare_renaissance,UnsortedIntervals,SortedIntervals).

generate_neg_renaissance_aux() :- sort_renaissance(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_renaissance(NegatedIntervals).

neg_renaissance_at_252(Res) :- setof((Start,End),neg_renaissance(Start,End),AllINtervals), checkvalidity(252,AllINtervals,Res).

check_query() :- write('Query = neg_renaissance_at_252'), (neg_renaissance_at_252(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_renaissance_aux().

