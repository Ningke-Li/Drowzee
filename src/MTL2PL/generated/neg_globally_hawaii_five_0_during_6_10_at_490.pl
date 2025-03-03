:- include('database.pl').
hawaii_five_0(Start,End) :- begin('hawaii_five_0',_,_,Start), end('hawaii_five_0',_,_,End), Start=<End.

globally_hawaii_five_0_during_6_10(Start,End) :- hawaii_five_0(Start1,End1), Start is (Start1-6), End is (End1-10), Start=<End.

compare_globally_hawaii_five_0_during_6_10(Dir,globally_hawaii_five_0_during_6_10(Start1,_),globally_hawaii_five_0_during_6_10(Start2,_)) :- Start1=<Start2.

generate_neg_globally_hawaii_five_0_during_6_10([]).

generate_neg_globally_hawaii_five_0_during_6_10([(Start,End) | Tail]) :- assert(neg_globally_hawaii_five_0_during_6_10(Start,End)), generate_neg_globally_hawaii_five_0_during_6_10(Tail).

sort_globally_hawaii_five_0_during_6_10(SortedIntervals) :- findall((Start,End),globally_hawaii_five_0_during_6_10(Start,End),UnsortedIntervals), predsort(compare_globally_hawaii_five_0_during_6_10,UnsortedIntervals,SortedIntervals).

generate_neg_globally_hawaii_five_0_during_6_10_aux() :- sort_globally_hawaii_five_0_during_6_10(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_hawaii_five_0_during_6_10(NegatedIntervals).

neg_globally_hawaii_five_0_during_6_10_at_490(Res) :- setof((Start,End),neg_globally_hawaii_five_0_during_6_10(Start,End),AllINtervals), checkvalidity(490,AllINtervals,Res).

check_query() :- write('Query = neg_globally_hawaii_five_0_during_6_10_at_490'), (neg_globally_hawaii_five_0_during_6_10_at_490(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_hawaii_five_0_during_6_10_aux().

