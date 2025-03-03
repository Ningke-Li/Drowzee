:- include('database.pl').
soul_eater(Start,End) :- begin('soul_eater',_,_,Start), end('soul_eater',_,_,End), Start=<End.

globally_soul_eater_during_5_7(Start,End) :- soul_eater(Start1,End1), Start is (Start1-5), End is (End1-7), Start=<End.

compare_globally_soul_eater_during_5_7(Dir,globally_soul_eater_during_5_7(Start1,_),globally_soul_eater_during_5_7(Start2,_)) :- Start1=<Start2.

generate_neg_globally_soul_eater_during_5_7([]).

generate_neg_globally_soul_eater_during_5_7([(Start,End) | Tail]) :- assert(neg_globally_soul_eater_during_5_7(Start,End)), generate_neg_globally_soul_eater_during_5_7(Tail).

sort_globally_soul_eater_during_5_7(SortedIntervals) :- findall((Start,End),globally_soul_eater_during_5_7(Start,End),UnsortedIntervals), predsort(compare_globally_soul_eater_during_5_7,UnsortedIntervals,SortedIntervals).

generate_neg_globally_soul_eater_during_5_7_aux() :- sort_globally_soul_eater_during_5_7(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_soul_eater_during_5_7(NegatedIntervals).

neg_globally_soul_eater_during_5_7_at_1276(Res) :- setof((Start,End),neg_globally_soul_eater_during_5_7(Start,End),AllINtervals), checkvalidity(1276,AllINtervals,Res).

check_query() :- write('Query = neg_globally_soul_eater_during_5_7_at_1276'), (neg_globally_soul_eater_during_5_7_at_1276(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_soul_eater_during_5_7_aux().

