:- include('database.pl').
the_good_wife(Start,End) :- begin('the_good_wife',_,_,Start), end('the_good_wife',_,_,End), Start=<End.

globally_the_good_wife_during_2_7(Start,End) :- the_good_wife(Start1,End1), Start is (Start1-2), End is (End1-7), Start=<End.

compare_globally_the_good_wife_during_2_7(Dir,globally_the_good_wife_during_2_7(Start1,_),globally_the_good_wife_during_2_7(Start2,_)) :- Start1=<Start2.

generate_neg_globally_the_good_wife_during_2_7([]).

generate_neg_globally_the_good_wife_during_2_7([(Start,End) | Tail]) :- assert(neg_globally_the_good_wife_during_2_7(Start,End)), generate_neg_globally_the_good_wife_during_2_7(Tail).

sort_globally_the_good_wife_during_2_7(SortedIntervals) :- findall((Start,End),globally_the_good_wife_during_2_7(Start,End),UnsortedIntervals), predsort(compare_globally_the_good_wife_during_2_7,UnsortedIntervals,SortedIntervals).

generate_neg_globally_the_good_wife_during_2_7_aux() :- sort_globally_the_good_wife_during_2_7(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_the_good_wife_during_2_7(NegatedIntervals).

neg_globally_the_good_wife_during_2_7_at_1578(Res) :- setof((Start,End),neg_globally_the_good_wife_during_2_7(Start,End),AllINtervals), checkvalidity(1578,AllINtervals,Res).

check_query() :- write('Query = neg_globally_the_good_wife_during_2_7_at_1578'), (neg_globally_the_good_wife_during_2_7_at_1578(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_the_good_wife_during_2_7_aux().

