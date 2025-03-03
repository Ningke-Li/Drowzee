:- include('database.pl').
ranger_program(Start,End) :- begin('ranger_program',_,_,Start), end('ranger_program',_,_,End), Start=<End.

finally_ranger_program_during_6_19(Start,End) :- ranger_program(Start1,End1), (Start1-19)=<(End1-6), Start is (Start1-19), End is (End1-6), Start=<End.

compare_finally_ranger_program_during_6_19(Dir,finally_ranger_program_during_6_19(Start1,_),finally_ranger_program_during_6_19(Start2,_)) :- Start1=<Start2.

generate_neg_finally_ranger_program_during_6_19([]).

generate_neg_finally_ranger_program_during_6_19([(Start,End) | Tail]) :- assert(neg_finally_ranger_program_during_6_19(Start,End)), generate_neg_finally_ranger_program_during_6_19(Tail).

sort_finally_ranger_program_during_6_19(SortedIntervals) :- findall((Start,End),finally_ranger_program_during_6_19(Start,End),UnsortedIntervals), predsort(compare_finally_ranger_program_during_6_19,UnsortedIntervals,SortedIntervals).

generate_neg_finally_ranger_program_during_6_19_aux() :- sort_finally_ranger_program_during_6_19(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_ranger_program_during_6_19(NegatedIntervals).

neg_finally_ranger_program_during_6_19_at_1614(Res) :- setof((Start,End),neg_finally_ranger_program_during_6_19(Start,End),AllINtervals), checkvalidity(1614,AllINtervals,Res).

check_query() :- write('Query = neg_finally_ranger_program_during_6_19_at_1614'), (neg_finally_ranger_program_during_6_19_at_1614(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_ranger_program_during_6_19_aux().

