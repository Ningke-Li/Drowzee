:- include('database.pl').
a_k___memnu(Start,End) :- begin('a_k___memnu',_,_,Start), end('a_k___memnu',_,_,End), Start=<End.

compare_a_k___memnu(Dir,a_k___memnu(Start1,_),a_k___memnu(Start2,_)) :- Start1=<Start2.

generate_neg_a_k___memnu([]).

generate_neg_a_k___memnu([(Start,End) | Tail]) :- assert(neg_a_k___memnu(Start,End)), generate_neg_a_k___memnu(Tail).

sort_a_k___memnu(SortedIntervals) :- findall((Start,End),a_k___memnu(Start,End),UnsortedIntervals), predsort(compare_a_k___memnu,UnsortedIntervals,SortedIntervals).

generate_neg_a_k___memnu_aux() :- sort_a_k___memnu(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_a_k___memnu(NegatedIntervals).

neg_a_k___memnu_at_494(Res) :- setof((Start,End),neg_a_k___memnu(Start,End),AllINtervals), checkvalidity(494,AllINtervals,Res).

check_query() :- write('Query = neg_a_k___memnu_at_494'), (neg_a_k___memnu_at_494(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_a_k___memnu_aux().

