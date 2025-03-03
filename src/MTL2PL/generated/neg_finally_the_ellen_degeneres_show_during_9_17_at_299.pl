:- include('database.pl').
the_ellen_degeneres_show(Start,End) :- begin('the_ellen_degeneres_show',_,_,Start), end('the_ellen_degeneres_show',_,_,End), Start=<End.

finally_the_ellen_degeneres_show_during_9_17(Start,End) :- the_ellen_degeneres_show(Start1,End1), (Start1-17)=<(End1-9), Start is (Start1-17), End is (End1-9), Start=<End.

compare_finally_the_ellen_degeneres_show_during_9_17(Dir,finally_the_ellen_degeneres_show_during_9_17(Start1,_),finally_the_ellen_degeneres_show_during_9_17(Start2,_)) :- Start1=<Start2.

generate_neg_finally_the_ellen_degeneres_show_during_9_17([]).

generate_neg_finally_the_ellen_degeneres_show_during_9_17([(Start,End) | Tail]) :- assert(neg_finally_the_ellen_degeneres_show_during_9_17(Start,End)), generate_neg_finally_the_ellen_degeneres_show_during_9_17(Tail).

sort_finally_the_ellen_degeneres_show_during_9_17(SortedIntervals) :- findall((Start,End),finally_the_ellen_degeneres_show_during_9_17(Start,End),UnsortedIntervals), predsort(compare_finally_the_ellen_degeneres_show_during_9_17,UnsortedIntervals,SortedIntervals).

generate_neg_finally_the_ellen_degeneres_show_during_9_17_aux() :- sort_finally_the_ellen_degeneres_show_during_9_17(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_the_ellen_degeneres_show_during_9_17(NegatedIntervals).

neg_finally_the_ellen_degeneres_show_during_9_17_at_299(Res) :- setof((Start,End),neg_finally_the_ellen_degeneres_show_during_9_17(Start,End),AllINtervals), checkvalidity(299,AllINtervals,Res).

check_query() :- write('Query = neg_finally_the_ellen_degeneres_show_during_9_17_at_299'), (neg_finally_the_ellen_degeneres_show_during_9_17_at_299(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_the_ellen_degeneres_show_during_9_17_aux().

