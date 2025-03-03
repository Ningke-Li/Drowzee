:- include('database.pl').
ev_2011_england_riots(Start,End) :- begin('ev_2011_england_riots',_,_,Start), end('ev_2011_england_riots',_,_,End), Start=<End.

compare_ev_2011_england_riots(Dir,ev_2011_england_riots(Start1,_),ev_2011_england_riots(Start2,_)) :- Start1=<Start2.

generate_neg_ev_2011_england_riots([]).

generate_neg_ev_2011_england_riots([(Start,End) | Tail]) :- assert(neg_ev_2011_england_riots(Start,End)), generate_neg_ev_2011_england_riots(Tail).

sort_ev_2011_england_riots(SortedIntervals) :- findall((Start,End),ev_2011_england_riots(Start,End),UnsortedIntervals), predsort(compare_ev_2011_england_riots,UnsortedIntervals,SortedIntervals).

generate_neg_ev_2011_england_riots_aux() :- sort_ev_2011_england_riots(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ev_2011_england_riots(NegatedIntervals).

neg_ev_2011_england_riots_at_506(Res) :- setof((Start,End),neg_ev_2011_england_riots(Start,End),AllINtervals), checkvalidity(506,AllINtervals,Res).

check_query() :- write('Query = neg_ev_2011_england_riots_at_506'), (neg_ev_2011_england_riots_at_506(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ev_2011_england_riots_aux().

