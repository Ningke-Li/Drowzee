:- include('database.pl').
sonic_x(Start,End) :- begin('sonic_x',_,_,Start), end('sonic_x',_,_,End), Start=<End.

compare_sonic_x(Dir,sonic_x(Start1,_),sonic_x(Start2,_)) :- Start1=<Start2.

generate_neg_sonic_x([]).

generate_neg_sonic_x([(Start,End) | Tail]) :- assert(neg_sonic_x(Start,End)), generate_neg_sonic_x(Tail).

sort_sonic_x(SortedIntervals) :- findall((Start,End),sonic_x(Start,End),UnsortedIntervals), predsort(compare_sonic_x,UnsortedIntervals,SortedIntervals).

generate_neg_sonic_x_aux() :- sort_sonic_x(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_sonic_x(NegatedIntervals).

neg_sonic_x_at_903(Res) :- setof((Start,End),neg_sonic_x(Start,End),AllINtervals), checkvalidity(903,AllINtervals,Res).

check_query() :- write('Query = neg_sonic_x_at_903'), (neg_sonic_x_at_903(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_sonic_x_aux().

