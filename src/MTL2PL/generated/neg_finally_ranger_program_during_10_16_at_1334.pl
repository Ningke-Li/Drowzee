:- include('database.pl').
ranger_program(Start,End) :- begin('ranger_program',_,_,Start), end('ranger_program',_,_,End), Start=<End.

finally_ranger_program_during_10_16(Start,End) :- ranger_program(Start1,End1), (Start1-16)=<(End1-10), Start is (Start1-16), End is (End1-10), Start=<End.

compare_finally_ranger_program_during_10_16(Dir,finally_ranger_program_during_10_16(Start1,_),finally_ranger_program_during_10_16(Start2,_)) :- Start1=<Start2.

generate_neg_finally_ranger_program_during_10_16([]).

generate_neg_finally_ranger_program_during_10_16([(Start,End) | Tail]) :- assert(neg_finally_ranger_program_during_10_16(Start,End)), generate_neg_finally_ranger_program_during_10_16(Tail).

sort_finally_ranger_program_during_10_16(SortedIntervals) :- findall((Start,End),finally_ranger_program_during_10_16(Start,End),UnsortedIntervals), predsort(compare_finally_ranger_program_during_10_16,UnsortedIntervals,SortedIntervals).

generate_neg_finally_ranger_program_during_10_16_aux() :- sort_finally_ranger_program_during_10_16(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_ranger_program_during_10_16(NegatedIntervals).

neg_finally_ranger_program_during_10_16_at_1334(Res) :- setof((Start,End),neg_finally_ranger_program_during_10_16(Start,End),AllINtervals), checkvalidity(1334,AllINtervals,Res).

check_query() :- write('Query = neg_finally_ranger_program_during_10_16_at_1334'), (neg_finally_ranger_program_during_10_16_at_1334(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_ranger_program_during_10_16_aux().

