:- include('database.pl').
northern_seven_years__war(Start,End) :- begin('northern_seven_years__war',_,_,Start), end('northern_seven_years__war',_,_,End), Start=<End.

globally_northern_seven_years__war_during_1_7(Start,End) :- northern_seven_years__war(Start1,End1), Start is (Start1-1), End is (End1-7), Start=<End.

compare_globally_northern_seven_years__war_during_1_7(Dir,globally_northern_seven_years__war_during_1_7(Start1,_),globally_northern_seven_years__war_during_1_7(Start2,_)) :- Start1=<Start2.

generate_neg_globally_northern_seven_years__war_during_1_7([]).

generate_neg_globally_northern_seven_years__war_during_1_7([(Start,End) | Tail]) :- assert(neg_globally_northern_seven_years__war_during_1_7(Start,End)), generate_neg_globally_northern_seven_years__war_during_1_7(Tail).

sort_globally_northern_seven_years__war_during_1_7(SortedIntervals) :- findall((Start,End),globally_northern_seven_years__war_during_1_7(Start,End),UnsortedIntervals), predsort(compare_globally_northern_seven_years__war_during_1_7,UnsortedIntervals,SortedIntervals).

generate_neg_globally_northern_seven_years__war_during_1_7_aux() :- sort_globally_northern_seven_years__war_during_1_7(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_northern_seven_years__war_during_1_7(NegatedIntervals).

neg_globally_northern_seven_years__war_during_1_7_at_1737(Res) :- setof((Start,End),neg_globally_northern_seven_years__war_during_1_7(Start,End),AllINtervals), checkvalidity(1737,AllINtervals,Res).

check_query() :- write('Query = neg_globally_northern_seven_years__war_during_1_7_at_1737'), (neg_globally_northern_seven_years__war_during_1_7_at_1737(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_northern_seven_years__war_during_1_7_aux().

