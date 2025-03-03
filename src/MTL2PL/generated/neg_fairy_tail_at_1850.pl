:- include('database.pl').
fairy_tail(Start,End) :- begin('fairy_tail',_,_,Start), end('fairy_tail',_,_,End), Start=<End.

compare_fairy_tail(Dir,fairy_tail(Start1,_),fairy_tail(Start2,_)) :- Start1=<Start2.

generate_neg_fairy_tail([]).

generate_neg_fairy_tail([(Start,End) | Tail]) :- assert(neg_fairy_tail(Start,End)), generate_neg_fairy_tail(Tail).

sort_fairy_tail(SortedIntervals) :- findall((Start,End),fairy_tail(Start,End),UnsortedIntervals), predsort(compare_fairy_tail,UnsortedIntervals,SortedIntervals).

generate_neg_fairy_tail_aux() :- sort_fairy_tail(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_fairy_tail(NegatedIntervals).

neg_fairy_tail_at_1850(Res) :- setof((Start,End),neg_fairy_tail(Start,End),AllINtervals), checkvalidity(1850,AllINtervals,Res).

check_query() :- write('Query = neg_fairy_tail_at_1850'), (neg_fairy_tail_at_1850(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_fairy_tail_aux().

