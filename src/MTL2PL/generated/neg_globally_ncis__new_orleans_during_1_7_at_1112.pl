:- include('database.pl').
ncis__new_orleans(Start,End) :- begin('ncis__new_orleans',_,_,Start), end('ncis__new_orleans',_,_,End), Start=<End.

globally_ncis__new_orleans_during_1_7(Start,End) :- ncis__new_orleans(Start1,End1), Start is (Start1-1), End is (End1-7), Start=<End.

compare_globally_ncis__new_orleans_during_1_7(Dir,globally_ncis__new_orleans_during_1_7(Start1,_),globally_ncis__new_orleans_during_1_7(Start2,_)) :- Start1=<Start2.

generate_neg_globally_ncis__new_orleans_during_1_7([]).

generate_neg_globally_ncis__new_orleans_during_1_7([(Start,End) | Tail]) :- assert(neg_globally_ncis__new_orleans_during_1_7(Start,End)), generate_neg_globally_ncis__new_orleans_during_1_7(Tail).

sort_globally_ncis__new_orleans_during_1_7(SortedIntervals) :- findall((Start,End),globally_ncis__new_orleans_during_1_7(Start,End),UnsortedIntervals), predsort(compare_globally_ncis__new_orleans_during_1_7,UnsortedIntervals,SortedIntervals).

generate_neg_globally_ncis__new_orleans_during_1_7_aux() :- sort_globally_ncis__new_orleans_during_1_7(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_ncis__new_orleans_during_1_7(NegatedIntervals).

neg_globally_ncis__new_orleans_during_1_7_at_1112(Res) :- setof((Start,End),neg_globally_ncis__new_orleans_during_1_7(Start,End),AllINtervals), checkvalidity(1112,AllINtervals,Res).

check_query() :- write('Query = neg_globally_ncis__new_orleans_during_1_7_at_1112'), (neg_globally_ncis__new_orleans_during_1_7_at_1112(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_ncis__new_orleans_during_1_7_aux().

