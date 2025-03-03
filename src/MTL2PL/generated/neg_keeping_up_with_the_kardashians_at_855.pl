:- include('database.pl').
keeping_up_with_the_kardashians(Start,End) :- begin('keeping_up_with_the_kardashians',_,_,Start), end('keeping_up_with_the_kardashians',_,_,End), Start=<End.

compare_keeping_up_with_the_kardashians(Dir,keeping_up_with_the_kardashians(Start1,_),keeping_up_with_the_kardashians(Start2,_)) :- Start1=<Start2.

generate_neg_keeping_up_with_the_kardashians([]).

generate_neg_keeping_up_with_the_kardashians([(Start,End) | Tail]) :- assert(neg_keeping_up_with_the_kardashians(Start,End)), generate_neg_keeping_up_with_the_kardashians(Tail).

sort_keeping_up_with_the_kardashians(SortedIntervals) :- findall((Start,End),keeping_up_with_the_kardashians(Start,End),UnsortedIntervals), predsort(compare_keeping_up_with_the_kardashians,UnsortedIntervals,SortedIntervals).

generate_neg_keeping_up_with_the_kardashians_aux() :- sort_keeping_up_with_the_kardashians(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_keeping_up_with_the_kardashians(NegatedIntervals).

neg_keeping_up_with_the_kardashians_at_855(Res) :- setof((Start,End),neg_keeping_up_with_the_kardashians(Start,End),AllINtervals), checkvalidity(855,AllINtervals,Res).

check_query() :- write('Query = neg_keeping_up_with_the_kardashians_at_855'), (neg_keeping_up_with_the_kardashians_at_855(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_keeping_up_with_the_kardashians_aux().

