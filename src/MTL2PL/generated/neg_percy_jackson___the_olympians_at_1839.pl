:- include('database.pl').
percy_jackson___the_olympians(Start,End) :- begin('percy_jackson___the_olympians',_,_,Start), end('percy_jackson___the_olympians',_,_,End), Start=<End.

compare_percy_jackson___the_olympians(Dir,percy_jackson___the_olympians(Start1,_),percy_jackson___the_olympians(Start2,_)) :- Start1=<Start2.

generate_neg_percy_jackson___the_olympians([]).

generate_neg_percy_jackson___the_olympians([(Start,End) | Tail]) :- assert(neg_percy_jackson___the_olympians(Start,End)), generate_neg_percy_jackson___the_olympians(Tail).

sort_percy_jackson___the_olympians(SortedIntervals) :- findall((Start,End),percy_jackson___the_olympians(Start,End),UnsortedIntervals), predsort(compare_percy_jackson___the_olympians,UnsortedIntervals,SortedIntervals).

generate_neg_percy_jackson___the_olympians_aux() :- sort_percy_jackson___the_olympians(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_percy_jackson___the_olympians(NegatedIntervals).

neg_percy_jackson___the_olympians_at_1839(Res) :- setof((Start,End),neg_percy_jackson___the_olympians(Start,End),AllINtervals), checkvalidity(1839,AllINtervals,Res).

check_query() :- write('Query = neg_percy_jackson___the_olympians_at_1839'), (neg_percy_jackson___the_olympians_at_1839(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_percy_jackson___the_olympians_aux().

