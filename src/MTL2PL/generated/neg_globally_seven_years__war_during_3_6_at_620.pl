:- include('database.pl').
seven_years__war(Start,End) :- begin('seven_years__war',_,_,Start), end('seven_years__war',_,_,End), Start=<End.

globally_seven_years__war_during_3_6(Start,End) :- seven_years__war(Start1,End1), Start is (Start1-3), End is (End1-6), Start=<End.

compare_globally_seven_years__war_during_3_6(Dir,globally_seven_years__war_during_3_6(Start1,_),globally_seven_years__war_during_3_6(Start2,_)) :- Start1=<Start2.

generate_neg_globally_seven_years__war_during_3_6([]).

generate_neg_globally_seven_years__war_during_3_6([(Start,End) | Tail]) :- assert(neg_globally_seven_years__war_during_3_6(Start,End)), generate_neg_globally_seven_years__war_during_3_6(Tail).

sort_globally_seven_years__war_during_3_6(SortedIntervals) :- findall((Start,End),globally_seven_years__war_during_3_6(Start,End),UnsortedIntervals), predsort(compare_globally_seven_years__war_during_3_6,UnsortedIntervals,SortedIntervals).

generate_neg_globally_seven_years__war_during_3_6_aux() :- sort_globally_seven_years__war_during_3_6(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_seven_years__war_during_3_6(NegatedIntervals).

neg_globally_seven_years__war_during_3_6_at_620(Res) :- setof((Start,End),neg_globally_seven_years__war_during_3_6(Start,End),AllINtervals), checkvalidity(620,AllINtervals,Res).

check_query() :- write('Query = neg_globally_seven_years__war_during_3_6_at_620'), (neg_globally_seven_years__war_during_3_6_at_620(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_seven_years__war_during_3_6_aux().

