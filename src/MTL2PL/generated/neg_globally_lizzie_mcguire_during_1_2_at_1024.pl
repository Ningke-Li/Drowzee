:- include('database.pl').
lizzie_mcguire(Start,End) :- begin('lizzie_mcguire',_,_,Start), end('lizzie_mcguire',_,_,End), Start=<End.

globally_lizzie_mcguire_during_1_2(Start,End) :- lizzie_mcguire(Start1,End1), Start is (Start1-1), End is (End1-2), Start=<End.

compare_globally_lizzie_mcguire_during_1_2(Dir,globally_lizzie_mcguire_during_1_2(Start1,_),globally_lizzie_mcguire_during_1_2(Start2,_)) :- Start1=<Start2.

generate_neg_globally_lizzie_mcguire_during_1_2([]).

generate_neg_globally_lizzie_mcguire_during_1_2([(Start,End) | Tail]) :- assert(neg_globally_lizzie_mcguire_during_1_2(Start,End)), generate_neg_globally_lizzie_mcguire_during_1_2(Tail).

sort_globally_lizzie_mcguire_during_1_2(SortedIntervals) :- findall((Start,End),globally_lizzie_mcguire_during_1_2(Start,End),UnsortedIntervals), predsort(compare_globally_lizzie_mcguire_during_1_2,UnsortedIntervals,SortedIntervals).

generate_neg_globally_lizzie_mcguire_during_1_2_aux() :- sort_globally_lizzie_mcguire_during_1_2(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_lizzie_mcguire_during_1_2(NegatedIntervals).

neg_globally_lizzie_mcguire_during_1_2_at_1024(Res) :- setof((Start,End),neg_globally_lizzie_mcguire_during_1_2(Start,End),AllINtervals), checkvalidity(1024,AllINtervals,Res).

check_query() :- write('Query = neg_globally_lizzie_mcguire_during_1_2_at_1024'), (neg_globally_lizzie_mcguire_during_1_2_at_1024(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_lizzie_mcguire_during_1_2_aux().

