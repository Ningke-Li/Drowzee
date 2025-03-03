:- include('database.pl').
ozark(Start,End) :- begin('ozark',_,_,Start), end('ozark',_,_,End), Start=<End.

compare_ozark(Dir,ozark(Start1,_),ozark(Start2,_)) :- Start1=<Start2.

generate_neg_ozark([]).

generate_neg_ozark([(Start,End) | Tail]) :- assert(neg_ozark(Start,End)), generate_neg_ozark(Tail).

sort_ozark(SortedIntervals) :- findall((Start,End),ozark(Start,End),UnsortedIntervals), predsort(compare_ozark,UnsortedIntervals,SortedIntervals).

generate_neg_ozark_aux() :- sort_ozark(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ozark(NegatedIntervals).

neg_ozark_at_1667(Res) :- setof((Start,End),neg_ozark(Start,End),AllINtervals), checkvalidity(1667,AllINtervals,Res).

check_query() :- write('Query = neg_ozark_at_1667'), (neg_ozark_at_1667(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ozark_aux().

