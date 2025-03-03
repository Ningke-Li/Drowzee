:- include('database.pl').
schitt_s_creek(Start,End) :- begin('schitt_s_creek',_,_,Start), end('schitt_s_creek',_,_,End), Start=<End.

finally_schitt_s_creek_during_1_19(Start,End) :- schitt_s_creek(Start1,End1), (Start1-19)=<(End1-1), Start is (Start1-19), End is (End1-1), Start=<End.

compare_finally_schitt_s_creek_during_1_19(Dir,finally_schitt_s_creek_during_1_19(Start1,_),finally_schitt_s_creek_during_1_19(Start2,_)) :- Start1=<Start2.

generate_neg_finally_schitt_s_creek_during_1_19([]).

generate_neg_finally_schitt_s_creek_during_1_19([(Start,End) | Tail]) :- assert(neg_finally_schitt_s_creek_during_1_19(Start,End)), generate_neg_finally_schitt_s_creek_during_1_19(Tail).

sort_finally_schitt_s_creek_during_1_19(SortedIntervals) :- findall((Start,End),finally_schitt_s_creek_during_1_19(Start,End),UnsortedIntervals), predsort(compare_finally_schitt_s_creek_during_1_19,UnsortedIntervals,SortedIntervals).

generate_neg_finally_schitt_s_creek_during_1_19_aux() :- sort_finally_schitt_s_creek_during_1_19(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_schitt_s_creek_during_1_19(NegatedIntervals).

neg_finally_schitt_s_creek_during_1_19_at_1825(Res) :- setof((Start,End),neg_finally_schitt_s_creek_during_1_19(Start,End),AllINtervals), checkvalidity(1825,AllINtervals,Res).

check_query() :- write('Query = neg_finally_schitt_s_creek_during_1_19_at_1825'), (neg_finally_schitt_s_creek_during_1_19_at_1825(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_schitt_s_creek_during_1_19_aux().

