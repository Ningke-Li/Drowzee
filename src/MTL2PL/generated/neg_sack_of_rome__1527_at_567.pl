:- include('database.pl').
sack_of_rome__1527(Start,End) :- begin('sack_of_rome__1527',_,_,Start), end('sack_of_rome__1527',_,_,End), Start=<End.

compare_sack_of_rome__1527(Dir,sack_of_rome__1527(Start1,_),sack_of_rome__1527(Start2,_)) :- Start1=<Start2.

generate_neg_sack_of_rome__1527([]).

generate_neg_sack_of_rome__1527([(Start,End) | Tail]) :- assert(neg_sack_of_rome__1527(Start,End)), generate_neg_sack_of_rome__1527(Tail).

sort_sack_of_rome__1527(SortedIntervals) :- findall((Start,End),sack_of_rome__1527(Start,End),UnsortedIntervals), predsort(compare_sack_of_rome__1527,UnsortedIntervals,SortedIntervals).

generate_neg_sack_of_rome__1527_aux() :- sort_sack_of_rome__1527(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_sack_of_rome__1527(NegatedIntervals).

neg_sack_of_rome__1527_at_567(Res) :- setof((Start,End),neg_sack_of_rome__1527(Start,End),AllINtervals), checkvalidity(567,AllINtervals,Res).

check_query() :- write('Query = neg_sack_of_rome__1527_at_567'), (neg_sack_of_rome__1527_at_567(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_sack_of_rome__1527_aux().

