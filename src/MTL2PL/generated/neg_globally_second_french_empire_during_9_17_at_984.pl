:- include('database.pl').
second_french_empire(Start,End) :- begin('second_french_empire',_,_,Start), end('second_french_empire',_,_,End), Start=<End.

globally_second_french_empire_during_9_17(Start,End) :- second_french_empire(Start1,End1), Start is (Start1-9), End is (End1-17), Start=<End.

compare_globally_second_french_empire_during_9_17(Dir,globally_second_french_empire_during_9_17(Start1,_),globally_second_french_empire_during_9_17(Start2,_)) :- Start1=<Start2.

generate_neg_globally_second_french_empire_during_9_17([]).

generate_neg_globally_second_french_empire_during_9_17([(Start,End) | Tail]) :- assert(neg_globally_second_french_empire_during_9_17(Start,End)), generate_neg_globally_second_french_empire_during_9_17(Tail).

sort_globally_second_french_empire_during_9_17(SortedIntervals) :- findall((Start,End),globally_second_french_empire_during_9_17(Start,End),UnsortedIntervals), predsort(compare_globally_second_french_empire_during_9_17,UnsortedIntervals,SortedIntervals).

generate_neg_globally_second_french_empire_during_9_17_aux() :- sort_globally_second_french_empire_during_9_17(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_second_french_empire_during_9_17(NegatedIntervals).

neg_globally_second_french_empire_during_9_17_at_984(Res) :- setof((Start,End),neg_globally_second_french_empire_during_9_17(Start,End),AllINtervals), checkvalidity(984,AllINtervals,Res).

check_query() :- write('Query = neg_globally_second_french_empire_during_9_17_at_984'), (neg_globally_second_french_empire_during_9_17_at_984(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_second_french_empire_during_9_17_aux().

