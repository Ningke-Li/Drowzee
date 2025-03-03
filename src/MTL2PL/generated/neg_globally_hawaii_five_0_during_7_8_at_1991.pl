:- include('database.pl').
hawaii_five_0(Start,End) :- begin('hawaii_five_0',_,_,Start), end('hawaii_five_0',_,_,End), Start=<End.

globally_hawaii_five_0_during_7_8(Start,End) :- hawaii_five_0(Start1,End1), Start is (Start1-7), End is (End1-8), Start=<End.

compare_globally_hawaii_five_0_during_7_8(Dir,globally_hawaii_five_0_during_7_8(Start1,_),globally_hawaii_five_0_during_7_8(Start2,_)) :- Start1=<Start2.

generate_neg_globally_hawaii_five_0_during_7_8([]).

generate_neg_globally_hawaii_five_0_during_7_8([(Start,End) | Tail]) :- assert(neg_globally_hawaii_five_0_during_7_8(Start,End)), generate_neg_globally_hawaii_five_0_during_7_8(Tail).

sort_globally_hawaii_five_0_during_7_8(SortedIntervals) :- findall((Start,End),globally_hawaii_five_0_during_7_8(Start,End),UnsortedIntervals), predsort(compare_globally_hawaii_five_0_during_7_8,UnsortedIntervals,SortedIntervals).

generate_neg_globally_hawaii_five_0_during_7_8_aux() :- sort_globally_hawaii_five_0_during_7_8(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_hawaii_five_0_during_7_8(NegatedIntervals).

neg_globally_hawaii_five_0_during_7_8_at_1991(Res) :- setof((Start,End),neg_globally_hawaii_five_0_during_7_8(Start,End),AllINtervals), checkvalidity(1991,AllINtervals,Res).

check_query() :- write('Query = neg_globally_hawaii_five_0_during_7_8_at_1991'), (neg_globally_hawaii_five_0_during_7_8_at_1991(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_hawaii_five_0_during_7_8_aux().

