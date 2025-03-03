:- include('database.pl').
siege_of_leningrad(Start,End) :- begin('siege_of_leningrad',_,_,Start), end('siege_of_leningrad',_,_,End), Start=<End.

finally_siege_of_leningrad_during_7_18(Start,End) :- siege_of_leningrad(Start1,End1), (Start1-18)=<(End1-7), Start is (Start1-18), End is (End1-7), Start=<End.

compare_finally_siege_of_leningrad_during_7_18(Dir,finally_siege_of_leningrad_during_7_18(Start1,_),finally_siege_of_leningrad_during_7_18(Start2,_)) :- Start1=<Start2.

generate_neg_finally_siege_of_leningrad_during_7_18([]).

generate_neg_finally_siege_of_leningrad_during_7_18([(Start,End) | Tail]) :- assert(neg_finally_siege_of_leningrad_during_7_18(Start,End)), generate_neg_finally_siege_of_leningrad_during_7_18(Tail).

sort_finally_siege_of_leningrad_during_7_18(SortedIntervals) :- findall((Start,End),finally_siege_of_leningrad_during_7_18(Start,End),UnsortedIntervals), predsort(compare_finally_siege_of_leningrad_during_7_18,UnsortedIntervals,SortedIntervals).

generate_neg_finally_siege_of_leningrad_during_7_18_aux() :- sort_finally_siege_of_leningrad_during_7_18(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_siege_of_leningrad_during_7_18(NegatedIntervals).

neg_finally_siege_of_leningrad_during_7_18_at_1360(Res) :- setof((Start,End),neg_finally_siege_of_leningrad_during_7_18(Start,End),AllINtervals), checkvalidity(1360,AllINtervals,Res).

check_query() :- write('Query = neg_finally_siege_of_leningrad_during_7_18_at_1360'), (neg_finally_siege_of_leningrad_during_7_18_at_1360(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_siege_of_leningrad_during_7_18_aux().

