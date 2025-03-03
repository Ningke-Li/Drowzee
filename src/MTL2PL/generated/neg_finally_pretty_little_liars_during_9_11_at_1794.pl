:- include('database.pl').
pretty_little_liars(Start,End) :- begin('pretty_little_liars',_,_,Start), end('pretty_little_liars',_,_,End), Start=<End.

finally_pretty_little_liars_during_9_11(Start,End) :- pretty_little_liars(Start1,End1), (Start1-11)=<(End1-9), Start is (Start1-11), End is (End1-9), Start=<End.

compare_finally_pretty_little_liars_during_9_11(Dir,finally_pretty_little_liars_during_9_11(Start1,_),finally_pretty_little_liars_during_9_11(Start2,_)) :- Start1=<Start2.

generate_neg_finally_pretty_little_liars_during_9_11([]).

generate_neg_finally_pretty_little_liars_during_9_11([(Start,End) | Tail]) :- assert(neg_finally_pretty_little_liars_during_9_11(Start,End)), generate_neg_finally_pretty_little_liars_during_9_11(Tail).

sort_finally_pretty_little_liars_during_9_11(SortedIntervals) :- findall((Start,End),finally_pretty_little_liars_during_9_11(Start,End),UnsortedIntervals), predsort(compare_finally_pretty_little_liars_during_9_11,UnsortedIntervals,SortedIntervals).

generate_neg_finally_pretty_little_liars_during_9_11_aux() :- sort_finally_pretty_little_liars_during_9_11(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_pretty_little_liars_during_9_11(NegatedIntervals).

neg_finally_pretty_little_liars_during_9_11_at_1794(Res) :- setof((Start,End),neg_finally_pretty_little_liars_during_9_11(Start,End),AllINtervals), checkvalidity(1794,AllINtervals,Res).

check_query() :- write('Query = neg_finally_pretty_little_liars_during_9_11_at_1794'), (neg_finally_pretty_little_liars_during_9_11_at_1794(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_pretty_little_liars_during_9_11_aux().

