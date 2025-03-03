:- include('database.pl').
the_thundermans(Start,End) :- begin('the_thundermans',_,_,Start), end('the_thundermans',_,_,End), Start=<End.

compare_the_thundermans(Dir,the_thundermans(Start1,_),the_thundermans(Start2,_)) :- Start1=<Start2.

generate_neg_the_thundermans([]).

generate_neg_the_thundermans([(Start,End) | Tail]) :- assert(neg_the_thundermans(Start,End)), generate_neg_the_thundermans(Tail).

sort_the_thundermans(SortedIntervals) :- findall((Start,End),the_thundermans(Start,End),UnsortedIntervals), predsort(compare_the_thundermans,UnsortedIntervals,SortedIntervals).

generate_neg_the_thundermans_aux() :- sort_the_thundermans(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_the_thundermans(NegatedIntervals).

neg_the_thundermans_at_348(Res) :- setof((Start,End),neg_the_thundermans(Start,End),AllINtervals), checkvalidity(348,AllINtervals,Res).

check_query() :- write('Query = neg_the_thundermans_at_348'), (neg_the_thundermans_at_348(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_the_thundermans_aux().

