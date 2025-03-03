:- include('database.pl').
manhattan_project(Start,End) :- begin('manhattan_project',_,_,Start), end('manhattan_project',_,_,End), Start=<End.

finally_manhattan_project_during_9_12(Start,End) :- manhattan_project(Start1,End1), (Start1-12)=<(End1-9), Start is (Start1-12), End is (End1-9), Start=<End.

compare_finally_manhattan_project_during_9_12(Dir,finally_manhattan_project_during_9_12(Start1,_),finally_manhattan_project_during_9_12(Start2,_)) :- Start1=<Start2.

generate_neg_finally_manhattan_project_during_9_12([]).

generate_neg_finally_manhattan_project_during_9_12([(Start,End) | Tail]) :- assert(neg_finally_manhattan_project_during_9_12(Start,End)), generate_neg_finally_manhattan_project_during_9_12(Tail).

sort_finally_manhattan_project_during_9_12(SortedIntervals) :- findall((Start,End),finally_manhattan_project_during_9_12(Start,End),UnsortedIntervals), predsort(compare_finally_manhattan_project_during_9_12,UnsortedIntervals,SortedIntervals).

generate_neg_finally_manhattan_project_during_9_12_aux() :- sort_finally_manhattan_project_during_9_12(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_manhattan_project_during_9_12(NegatedIntervals).

neg_finally_manhattan_project_during_9_12_at_1799(Res) :- setof((Start,End),neg_finally_manhattan_project_during_9_12(Start,End),AllINtervals), checkvalidity(1799,AllINtervals,Res).

check_query() :- write('Query = neg_finally_manhattan_project_during_9_12_at_1799'), (neg_finally_manhattan_project_during_9_12_at_1799(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_manhattan_project_during_9_12_aux().

