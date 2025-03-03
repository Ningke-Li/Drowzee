:- include('database.pl').
qing_dynasty(Start,End) :- begin('qing_dynasty',_,_,Start), end('qing_dynasty',_,_,End), Start=<End.

globally_qing_dynasty_during_19_267(Start,End) :- qing_dynasty(Start1,End1), Start is (Start1-19), End is (End1-267), Start=<End.

compare_globally_qing_dynasty_during_19_267(Dir,globally_qing_dynasty_during_19_267(Start1,_),globally_qing_dynasty_during_19_267(Start2,_)) :- Start1=<Start2.

generate_neg_globally_qing_dynasty_during_19_267([]).

generate_neg_globally_qing_dynasty_during_19_267([(Start,End) | Tail]) :- assert(neg_globally_qing_dynasty_during_19_267(Start,End)), generate_neg_globally_qing_dynasty_during_19_267(Tail).

sort_globally_qing_dynasty_during_19_267(SortedIntervals) :- findall((Start,End),globally_qing_dynasty_during_19_267(Start,End),UnsortedIntervals), predsort(compare_globally_qing_dynasty_during_19_267,UnsortedIntervals,SortedIntervals).

generate_neg_globally_qing_dynasty_during_19_267_aux() :- sort_globally_qing_dynasty_during_19_267(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_qing_dynasty_during_19_267(NegatedIntervals).

neg_globally_qing_dynasty_during_19_267_at_579(Res) :- setof((Start,End),neg_globally_qing_dynasty_during_19_267(Start,End),AllINtervals), checkvalidity(579,AllINtervals,Res).

check_query() :- write('Query = neg_globally_qing_dynasty_during_19_267_at_579'), (neg_globally_qing_dynasty_during_19_267_at_579(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_qing_dynasty_during_19_267_aux().

