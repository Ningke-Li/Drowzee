:- include('database.pl').
operation_uranus(Start,End) :- begin('operation_uranus',_,_,Start), end('operation_uranus',_,_,End), Start=<End.

compare_operation_uranus(Dir,operation_uranus(Start1,_),operation_uranus(Start2,_)) :- Start1=<Start2.

generate_neg_operation_uranus([]).

generate_neg_operation_uranus([(Start,End) | Tail]) :- assert(neg_operation_uranus(Start,End)), generate_neg_operation_uranus(Tail).

sort_operation_uranus(SortedIntervals) :- findall((Start,End),operation_uranus(Start,End),UnsortedIntervals), predsort(compare_operation_uranus,UnsortedIntervals,SortedIntervals).

generate_neg_operation_uranus_aux() :- sort_operation_uranus(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_operation_uranus(NegatedIntervals).

neg_operation_uranus_at_1401(Res) :- setof((Start,End),neg_operation_uranus(Start,End),AllINtervals), checkvalidity(1401,AllINtervals,Res).

check_query() :- write('Query = neg_operation_uranus_at_1401'), (neg_operation_uranus_at_1401(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_operation_uranus_aux().

