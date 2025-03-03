:- include('database.pl').
billions(Start,End) :- begin('billions',_,_,Start), end('billions',_,_,End), Start=<End.

globally_billions_during_1_3(Start,End) :- billions(Start1,End1), Start is (Start1-1), End is (End1-3), Start=<End.

compare_globally_billions_during_1_3(Dir,globally_billions_during_1_3(Start1,_),globally_billions_during_1_3(Start2,_)) :- Start1=<Start2.

generate_neg_globally_billions_during_1_3([]).

generate_neg_globally_billions_during_1_3([(Start,End) | Tail]) :- assert(neg_globally_billions_during_1_3(Start,End)), generate_neg_globally_billions_during_1_3(Tail).

sort_globally_billions_during_1_3(SortedIntervals) :- findall((Start,End),globally_billions_during_1_3(Start,End),UnsortedIntervals), predsort(compare_globally_billions_during_1_3,UnsortedIntervals,SortedIntervals).

generate_neg_globally_billions_during_1_3_aux() :- sort_globally_billions_during_1_3(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_billions_during_1_3(NegatedIntervals).

neg_globally_billions_during_1_3_at_1505(Res) :- setof((Start,End),neg_globally_billions_during_1_3(Start,End),AllINtervals), checkvalidity(1505,AllINtervals,Res).

check_query() :- write('Query = neg_globally_billions_during_1_3_at_1505'), (neg_globally_billions_during_1_3_at_1505(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_billions_during_1_3_aux().

