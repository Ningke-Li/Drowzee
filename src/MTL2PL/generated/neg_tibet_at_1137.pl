:- include('database.pl').
tibet(Start,End) :- begin('tibet',_,_,Start), end('tibet',_,_,End), Start=<End.

compare_tibet(Dir,tibet(Start1,_),tibet(Start2,_)) :- Start1=<Start2.

generate_neg_tibet([]).

generate_neg_tibet([(Start,End) | Tail]) :- assert(neg_tibet(Start,End)), generate_neg_tibet(Tail).

sort_tibet(SortedIntervals) :- findall((Start,End),tibet(Start,End),UnsortedIntervals), predsort(compare_tibet,UnsortedIntervals,SortedIntervals).

generate_neg_tibet_aux() :- sort_tibet(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_tibet(NegatedIntervals).

neg_tibet_at_1137(Res) :- setof((Start,End),neg_tibet(Start,End),AllINtervals), checkvalidity(1137,AllINtervals,Res).

check_query() :- write('Query = neg_tibet_at_1137'), (neg_tibet_at_1137(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_tibet_aux().

