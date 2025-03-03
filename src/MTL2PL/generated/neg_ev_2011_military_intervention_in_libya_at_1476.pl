:- include('database.pl').
ev_2011_military_intervention_in_libya(Start,End) :- begin('ev_2011_military_intervention_in_libya',_,_,Start), end('ev_2011_military_intervention_in_libya',_,_,End), Start=<End.

compare_ev_2011_military_intervention_in_libya(Dir,ev_2011_military_intervention_in_libya(Start1,_),ev_2011_military_intervention_in_libya(Start2,_)) :- Start1=<Start2.

generate_neg_ev_2011_military_intervention_in_libya([]).

generate_neg_ev_2011_military_intervention_in_libya([(Start,End) | Tail]) :- assert(neg_ev_2011_military_intervention_in_libya(Start,End)), generate_neg_ev_2011_military_intervention_in_libya(Tail).

sort_ev_2011_military_intervention_in_libya(SortedIntervals) :- findall((Start,End),ev_2011_military_intervention_in_libya(Start,End),UnsortedIntervals), predsort(compare_ev_2011_military_intervention_in_libya,UnsortedIntervals,SortedIntervals).

generate_neg_ev_2011_military_intervention_in_libya_aux() :- sort_ev_2011_military_intervention_in_libya(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ev_2011_military_intervention_in_libya(NegatedIntervals).

neg_ev_2011_military_intervention_in_libya_at_1476(Res) :- setof((Start,End),neg_ev_2011_military_intervention_in_libya(Start,End),AllINtervals), checkvalidity(1476,AllINtervals,Res).

check_query() :- write('Query = neg_ev_2011_military_intervention_in_libya_at_1476'), (neg_ev_2011_military_intervention_in_libya_at_1476(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ev_2011_military_intervention_in_libya_aux().

