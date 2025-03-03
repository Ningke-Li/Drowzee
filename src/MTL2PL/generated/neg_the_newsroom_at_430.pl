:- include('database.pl').
the_newsroom(Start,End) :- begin('the_newsroom',_,_,Start), end('the_newsroom',_,_,End), Start=<End.

compare_the_newsroom(Dir,the_newsroom(Start1,_),the_newsroom(Start2,_)) :- Start1=<Start2.

generate_neg_the_newsroom([]).

generate_neg_the_newsroom([(Start,End) | Tail]) :- assert(neg_the_newsroom(Start,End)), generate_neg_the_newsroom(Tail).

sort_the_newsroom(SortedIntervals) :- findall((Start,End),the_newsroom(Start,End),UnsortedIntervals), predsort(compare_the_newsroom,UnsortedIntervals,SortedIntervals).

generate_neg_the_newsroom_aux() :- sort_the_newsroom(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_the_newsroom(NegatedIntervals).

neg_the_newsroom_at_430(Res) :- setof((Start,End),neg_the_newsroom(Start,End),AllINtervals), checkvalidity(430,AllINtervals,Res).

check_query() :- write('Query = neg_the_newsroom_at_430'), (neg_the_newsroom_at_430(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_the_newsroom_aux().

