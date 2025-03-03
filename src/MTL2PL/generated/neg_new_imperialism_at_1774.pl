:- include('database.pl').
new_imperialism(Start,End) :- begin('new_imperialism',_,_,Start), end('new_imperialism',_,_,End), Start=<End.

compare_new_imperialism(Dir,new_imperialism(Start1,_),new_imperialism(Start2,_)) :- Start1=<Start2.

generate_neg_new_imperialism([]).

generate_neg_new_imperialism([(Start,End) | Tail]) :- assert(neg_new_imperialism(Start,End)), generate_neg_new_imperialism(Tail).

sort_new_imperialism(SortedIntervals) :- findall((Start,End),new_imperialism(Start,End),UnsortedIntervals), predsort(compare_new_imperialism,UnsortedIntervals,SortedIntervals).

generate_neg_new_imperialism_aux() :- sort_new_imperialism(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_new_imperialism(NegatedIntervals).

neg_new_imperialism_at_1774(Res) :- setof((Start,End),neg_new_imperialism(Start,End),AllINtervals), checkvalidity(1774,AllINtervals,Res).

check_query() :- write('Query = neg_new_imperialism_at_1774'), (neg_new_imperialism_at_1774(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_new_imperialism_aux().

