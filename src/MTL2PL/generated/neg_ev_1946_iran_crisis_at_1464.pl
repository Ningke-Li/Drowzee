:- include('database.pl').
ev_1946_iran_crisis(Start,End) :- begin('ev_1946_iran_crisis',_,_,Start), end('ev_1946_iran_crisis',_,_,End), Start=<End.

compare_ev_1946_iran_crisis(Dir,ev_1946_iran_crisis(Start1,_),ev_1946_iran_crisis(Start2,_)) :- Start1=<Start2.

generate_neg_ev_1946_iran_crisis([]).

generate_neg_ev_1946_iran_crisis([(Start,End) | Tail]) :- assert(neg_ev_1946_iran_crisis(Start,End)), generate_neg_ev_1946_iran_crisis(Tail).

sort_ev_1946_iran_crisis(SortedIntervals) :- findall((Start,End),ev_1946_iran_crisis(Start,End),UnsortedIntervals), predsort(compare_ev_1946_iran_crisis,UnsortedIntervals,SortedIntervals).

generate_neg_ev_1946_iran_crisis_aux() :- sort_ev_1946_iran_crisis(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ev_1946_iran_crisis(NegatedIntervals).

neg_ev_1946_iran_crisis_at_1464(Res) :- setof((Start,End),neg_ev_1946_iran_crisis(Start,End),AllINtervals), checkvalidity(1464,AllINtervals,Res).

check_query() :- write('Query = neg_ev_1946_iran_crisis_at_1464'), (neg_ev_1946_iran_crisis_at_1464(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ev_1946_iran_crisis_aux().

