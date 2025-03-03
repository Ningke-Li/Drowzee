:- include('database.pl').
white_collar(Start,End) :- begin('white_collar',_,_,Start), end('white_collar',_,_,End), Start=<End.

compare_white_collar(Dir,white_collar(Start1,_),white_collar(Start2,_)) :- Start1=<Start2.

generate_neg_white_collar([]).

generate_neg_white_collar([(Start,End) | Tail]) :- assert(neg_white_collar(Start,End)), generate_neg_white_collar(Tail).

sort_white_collar(SortedIntervals) :- findall((Start,End),white_collar(Start,End),UnsortedIntervals), predsort(compare_white_collar,UnsortedIntervals,SortedIntervals).

generate_neg_white_collar_aux() :- sort_white_collar(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_white_collar(NegatedIntervals).

neg_white_collar_at_639(Res) :- setof((Start,End),neg_white_collar(Start,End),AllINtervals), checkvalidity(639,AllINtervals,Res).

check_query() :- write('Query = neg_white_collar_at_639'), (neg_white_collar_at_639(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_white_collar_aux().

