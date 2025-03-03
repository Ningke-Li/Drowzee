:- include('database.pl').
ev_2008_greek_riots(Start,End) :- begin('ev_2008_greek_riots',_,_,Start), end('ev_2008_greek_riots',_,_,End), Start=<End.

compare_ev_2008_greek_riots(Dir,ev_2008_greek_riots(Start1,_),ev_2008_greek_riots(Start2,_)) :- Start1=<Start2.

generate_neg_ev_2008_greek_riots([]).

generate_neg_ev_2008_greek_riots([(Start,End) | Tail]) :- assert(neg_ev_2008_greek_riots(Start,End)), generate_neg_ev_2008_greek_riots(Tail).

sort_ev_2008_greek_riots(SortedIntervals) :- findall((Start,End),ev_2008_greek_riots(Start,End),UnsortedIntervals), predsort(compare_ev_2008_greek_riots,UnsortedIntervals,SortedIntervals).

generate_neg_ev_2008_greek_riots_aux() :- sort_ev_2008_greek_riots(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ev_2008_greek_riots(NegatedIntervals).

neg_ev_2008_greek_riots_at_1808(Res) :- setof((Start,End),neg_ev_2008_greek_riots(Start,End),AllINtervals), checkvalidity(1808,AllINtervals,Res).

check_query() :- write('Query = neg_ev_2008_greek_riots_at_1808'), (neg_ev_2008_greek_riots_at_1808(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ev_2008_greek_riots_aux().

