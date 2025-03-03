:- include('database.pl').
violetta(Start,End) :- begin('violetta',_,_,Start), end('violetta',_,_,End), Start=<End.

globally_violetta_during_2_3(Start,End) :- violetta(Start1,End1), Start is (Start1-2), End is (End1-3), Start=<End.

compare_globally_violetta_during_2_3(Dir,globally_violetta_during_2_3(Start1,_),globally_violetta_during_2_3(Start2,_)) :- Start1=<Start2.

generate_neg_globally_violetta_during_2_3([]).

generate_neg_globally_violetta_during_2_3([(Start,End) | Tail]) :- assert(neg_globally_violetta_during_2_3(Start,End)), generate_neg_globally_violetta_during_2_3(Tail).

sort_globally_violetta_during_2_3(SortedIntervals) :- findall((Start,End),globally_violetta_during_2_3(Start,End),UnsortedIntervals), predsort(compare_globally_violetta_during_2_3,UnsortedIntervals,SortedIntervals).

generate_neg_globally_violetta_during_2_3_aux() :- sort_globally_violetta_during_2_3(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_violetta_during_2_3(NegatedIntervals).

neg_globally_violetta_during_2_3_at_13(Res) :- setof((Start,End),neg_globally_violetta_during_2_3(Start,End),AllINtervals), checkvalidity(13,AllINtervals,Res).

check_query() :- write('Query = neg_globally_violetta_during_2_3_at_13'), (neg_globally_violetta_during_2_3_at_13(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_violetta_during_2_3_aux().

