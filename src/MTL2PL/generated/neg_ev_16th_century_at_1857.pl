:- include('database.pl').
ev_16th_century(Start,End) :- begin('ev_16th_century',_,_,Start), end('ev_16th_century',_,_,End), Start=<End.

compare_ev_16th_century(Dir,ev_16th_century(Start1,_),ev_16th_century(Start2,_)) :- Start1=<Start2.

generate_neg_ev_16th_century([]).

generate_neg_ev_16th_century([(Start,End) | Tail]) :- assert(neg_ev_16th_century(Start,End)), generate_neg_ev_16th_century(Tail).

sort_ev_16th_century(SortedIntervals) :- findall((Start,End),ev_16th_century(Start,End),UnsortedIntervals), predsort(compare_ev_16th_century,UnsortedIntervals,SortedIntervals).

generate_neg_ev_16th_century_aux() :- sort_ev_16th_century(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ev_16th_century(NegatedIntervals).

neg_ev_16th_century_at_1857(Res) :- setof((Start,End),neg_ev_16th_century(Start,End),AllINtervals), checkvalidity(1857,AllINtervals,Res).

check_query() :- write('Query = neg_ev_16th_century_at_1857'), (neg_ev_16th_century_at_1857(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ev_16th_century_aux().

