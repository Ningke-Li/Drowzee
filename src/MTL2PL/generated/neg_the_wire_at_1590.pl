:- include('database.pl').
the_wire(Start,End) :- begin('the_wire',_,_,Start), end('the_wire',_,_,End), Start=<End.

compare_the_wire(Dir,the_wire(Start1,_),the_wire(Start2,_)) :- Start1=<Start2.

generate_neg_the_wire([]).

generate_neg_the_wire([(Start,End) | Tail]) :- assert(neg_the_wire(Start,End)), generate_neg_the_wire(Tail).

sort_the_wire(SortedIntervals) :- findall((Start,End),the_wire(Start,End),UnsortedIntervals), predsort(compare_the_wire,UnsortedIntervals,SortedIntervals).

generate_neg_the_wire_aux() :- sort_the_wire(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_the_wire(NegatedIntervals).

neg_the_wire_at_1590(Res) :- setof((Start,End),neg_the_wire(Start,End),AllINtervals), checkvalidity(1590,AllINtervals,Res).

check_query() :- write('Query = neg_the_wire_at_1590'), (neg_the_wire_at_1590(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_the_wire_aux().

