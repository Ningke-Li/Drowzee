:- include('database.pl').
siege_of_leningrad(Start,End) :- begin('siege_of_leningrad',_,_,Start), end('siege_of_leningrad',_,_,End), Start=<End.

finally_siege_of_leningrad_during_1_12(Start,End) :- siege_of_leningrad(Start1,End1), (Start1-12)=<(End1-1), Start is (Start1-12), End is (End1-1), Start=<End.

compare_finally_siege_of_leningrad_during_1_12(Dir,finally_siege_of_leningrad_during_1_12(Start1,_),finally_siege_of_leningrad_during_1_12(Start2,_)) :- Start1=<Start2.

generate_neg_finally_siege_of_leningrad_during_1_12([]).

generate_neg_finally_siege_of_leningrad_during_1_12([(Start,End) | Tail]) :- assert(neg_finally_siege_of_leningrad_during_1_12(Start,End)), generate_neg_finally_siege_of_leningrad_during_1_12(Tail).

sort_finally_siege_of_leningrad_during_1_12(SortedIntervals) :- findall((Start,End),finally_siege_of_leningrad_during_1_12(Start,End),UnsortedIntervals), predsort(compare_finally_siege_of_leningrad_during_1_12,UnsortedIntervals,SortedIntervals).

generate_neg_finally_siege_of_leningrad_during_1_12_aux() :- sort_finally_siege_of_leningrad_during_1_12(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_siege_of_leningrad_during_1_12(NegatedIntervals).

neg_finally_siege_of_leningrad_during_1_12_at_1556(Res) :- setof((Start,End),neg_finally_siege_of_leningrad_during_1_12(Start,End),AllINtervals), checkvalidity(1556,AllINtervals,Res).

check_query() :- write('Query = neg_finally_siege_of_leningrad_during_1_12_at_1556'), (neg_finally_siege_of_leningrad_during_1_12_at_1556(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_siege_of_leningrad_during_1_12_aux().

