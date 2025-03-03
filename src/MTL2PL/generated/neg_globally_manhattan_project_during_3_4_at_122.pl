:- include('database.pl').
manhattan_project(Start,End) :- begin('manhattan_project',_,_,Start), end('manhattan_project',_,_,End), Start=<End.

globally_manhattan_project_during_3_4(Start,End) :- manhattan_project(Start1,End1), Start is (Start1-3), End is (End1-4), Start=<End.

compare_globally_manhattan_project_during_3_4(Dir,globally_manhattan_project_during_3_4(Start1,_),globally_manhattan_project_during_3_4(Start2,_)) :- Start1=<Start2.

generate_neg_globally_manhattan_project_during_3_4([]).

generate_neg_globally_manhattan_project_during_3_4([(Start,End) | Tail]) :- assert(neg_globally_manhattan_project_during_3_4(Start,End)), generate_neg_globally_manhattan_project_during_3_4(Tail).

sort_globally_manhattan_project_during_3_4(SortedIntervals) :- findall((Start,End),globally_manhattan_project_during_3_4(Start,End),UnsortedIntervals), predsort(compare_globally_manhattan_project_during_3_4,UnsortedIntervals,SortedIntervals).

generate_neg_globally_manhattan_project_during_3_4_aux() :- sort_globally_manhattan_project_during_3_4(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_manhattan_project_during_3_4(NegatedIntervals).

neg_globally_manhattan_project_during_3_4_at_122(Res) :- setof((Start,End),neg_globally_manhattan_project_during_3_4(Start,End),AllINtervals), checkvalidity(122,AllINtervals,Res).

check_query() :- write('Query = neg_globally_manhattan_project_during_3_4_at_122'), (neg_globally_manhattan_project_during_3_4_at_122(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_manhattan_project_during_3_4_aux().

