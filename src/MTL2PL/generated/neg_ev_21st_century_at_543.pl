:- include('database.pl').
ev_21st_century(Start,End) :- begin('ev_21st_century',_,_,Start), end('ev_21st_century',_,_,End), Start=<End.

compare_ev_21st_century(Dir,ev_21st_century(Start1,_),ev_21st_century(Start2,_)) :- Start1=<Start2.

generate_neg_ev_21st_century([]).

generate_neg_ev_21st_century([(Start,End) | Tail]) :- assert(neg_ev_21st_century(Start,End)), generate_neg_ev_21st_century(Tail).

sort_ev_21st_century(SortedIntervals) :- findall((Start,End),ev_21st_century(Start,End),UnsortedIntervals), predsort(compare_ev_21st_century,UnsortedIntervals,SortedIntervals).

generate_neg_ev_21st_century_aux() :- sort_ev_21st_century(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ev_21st_century(NegatedIntervals).

neg_ev_21st_century_at_543(Res) :- setof((Start,End),neg_ev_21st_century(Start,End),AllINtervals), checkvalidity(543,AllINtervals,Res).

check_query() :- write('Query = neg_ev_21st_century_at_543'), (neg_ev_21st_century_at_543(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ev_21st_century_aux().

