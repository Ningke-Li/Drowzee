:- include('database.pl').
katyn_massacre(Start,End) :- begin('katyn_massacre',_,_,Start), end('katyn_massacre',_,_,End), Start=<End.

compare_katyn_massacre(Dir,katyn_massacre(Start1,_),katyn_massacre(Start2,_)) :- Start1=<Start2.

generate_neg_katyn_massacre([]).

generate_neg_katyn_massacre([(Start,End) | Tail]) :- assert(neg_katyn_massacre(Start,End)), generate_neg_katyn_massacre(Tail).

sort_katyn_massacre(SortedIntervals) :- findall((Start,End),katyn_massacre(Start,End),UnsortedIntervals), predsort(compare_katyn_massacre,UnsortedIntervals,SortedIntervals).

generate_neg_katyn_massacre_aux() :- sort_katyn_massacre(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_katyn_massacre(NegatedIntervals).

neg_katyn_massacre_at_1268(Res) :- setof((Start,End),neg_katyn_massacre(Start,End),AllINtervals), checkvalidity(1268,AllINtervals,Res).

check_query() :- write('Query = neg_katyn_massacre_at_1268'), (neg_katyn_massacre_at_1268(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_katyn_massacre_aux().

