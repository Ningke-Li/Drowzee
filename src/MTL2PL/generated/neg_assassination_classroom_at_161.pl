:- include('database.pl').
assassination_classroom(Start,End) :- begin('assassination_classroom',_,_,Start), end('assassination_classroom',_,_,End), Start=<End.

compare_assassination_classroom(Dir,assassination_classroom(Start1,_),assassination_classroom(Start2,_)) :- Start1=<Start2.

generate_neg_assassination_classroom([]).

generate_neg_assassination_classroom([(Start,End) | Tail]) :- assert(neg_assassination_classroom(Start,End)), generate_neg_assassination_classroom(Tail).

sort_assassination_classroom(SortedIntervals) :- findall((Start,End),assassination_classroom(Start,End),UnsortedIntervals), predsort(compare_assassination_classroom,UnsortedIntervals,SortedIntervals).

generate_neg_assassination_classroom_aux() :- sort_assassination_classroom(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_assassination_classroom(NegatedIntervals).

neg_assassination_classroom_at_161(Res) :- setof((Start,End),neg_assassination_classroom(Start,End),AllINtervals), checkvalidity(161,AllINtervals,Res).

check_query() :- write('Query = neg_assassination_classroom_at_161'), (neg_assassination_classroom_at_161(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_assassination_classroom_aux().

