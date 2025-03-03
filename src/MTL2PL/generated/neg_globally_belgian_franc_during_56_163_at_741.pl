:- include('database.pl').
belgian_franc(Start,End) :- begin('belgian_franc',_,_,Start), end('belgian_franc',_,_,End), Start=<End.

globally_belgian_franc_during_56_163(Start,End) :- belgian_franc(Start1,End1), Start is (Start1-56), End is (End1-163), Start=<End.

compare_globally_belgian_franc_during_56_163(Dir,globally_belgian_franc_during_56_163(Start1,_),globally_belgian_franc_during_56_163(Start2,_)) :- Start1=<Start2.

generate_neg_globally_belgian_franc_during_56_163([]).

generate_neg_globally_belgian_franc_during_56_163([(Start,End) | Tail]) :- assert(neg_globally_belgian_franc_during_56_163(Start,End)), generate_neg_globally_belgian_franc_during_56_163(Tail).

sort_globally_belgian_franc_during_56_163(SortedIntervals) :- findall((Start,End),globally_belgian_franc_during_56_163(Start,End),UnsortedIntervals), predsort(compare_globally_belgian_franc_during_56_163,UnsortedIntervals,SortedIntervals).

generate_neg_globally_belgian_franc_during_56_163_aux() :- sort_globally_belgian_franc_during_56_163(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_belgian_franc_during_56_163(NegatedIntervals).

neg_globally_belgian_franc_during_56_163_at_741(Res) :- setof((Start,End),neg_globally_belgian_franc_during_56_163(Start,End),AllINtervals), checkvalidity(741,AllINtervals,Res).

check_query() :- write('Query = neg_globally_belgian_franc_during_56_163_at_741'), (neg_globally_belgian_franc_during_56_163_at_741(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_belgian_franc_during_56_163_aux().

