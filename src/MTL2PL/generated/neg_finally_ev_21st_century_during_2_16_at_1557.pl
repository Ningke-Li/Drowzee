:- include('database.pl').
ev_21st_century(Start,End) :- begin('ev_21st_century',_,_,Start), end('ev_21st_century',_,_,End), Start=<End.

finally_ev_21st_century_during_2_16(Start,End) :- ev_21st_century(Start1,End1), (Start1-16)=<(End1-2), Start is (Start1-16), End is (End1-2), Start=<End.

compare_finally_ev_21st_century_during_2_16(Dir,finally_ev_21st_century_during_2_16(Start1,_),finally_ev_21st_century_during_2_16(Start2,_)) :- Start1=<Start2.

generate_neg_finally_ev_21st_century_during_2_16([]).

generate_neg_finally_ev_21st_century_during_2_16([(Start,End) | Tail]) :- assert(neg_finally_ev_21st_century_during_2_16(Start,End)), generate_neg_finally_ev_21st_century_during_2_16(Tail).

sort_finally_ev_21st_century_during_2_16(SortedIntervals) :- findall((Start,End),finally_ev_21st_century_during_2_16(Start,End),UnsortedIntervals), predsort(compare_finally_ev_21st_century_during_2_16,UnsortedIntervals,SortedIntervals).

generate_neg_finally_ev_21st_century_during_2_16_aux() :- sort_finally_ev_21st_century_during_2_16(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_ev_21st_century_during_2_16(NegatedIntervals).

neg_finally_ev_21st_century_during_2_16_at_1557(Res) :- setof((Start,End),neg_finally_ev_21st_century_during_2_16(Start,End),AllINtervals), checkvalidity(1557,AllINtervals,Res).

check_query() :- write('Query = neg_finally_ev_21st_century_during_2_16_at_1557'), (neg_finally_ev_21st_century_during_2_16_at_1557(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_ev_21st_century_during_2_16_aux().

