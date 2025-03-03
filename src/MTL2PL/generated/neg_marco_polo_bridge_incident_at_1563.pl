:- include('database.pl').
marco_polo_bridge_incident(Start,End) :- begin('marco_polo_bridge_incident',_,_,Start), end('marco_polo_bridge_incident',_,_,End), Start=<End.

compare_marco_polo_bridge_incident(Dir,marco_polo_bridge_incident(Start1,_),marco_polo_bridge_incident(Start2,_)) :- Start1=<Start2.

generate_neg_marco_polo_bridge_incident([]).

generate_neg_marco_polo_bridge_incident([(Start,End) | Tail]) :- assert(neg_marco_polo_bridge_incident(Start,End)), generate_neg_marco_polo_bridge_incident(Tail).

sort_marco_polo_bridge_incident(SortedIntervals) :- findall((Start,End),marco_polo_bridge_incident(Start,End),UnsortedIntervals), predsort(compare_marco_polo_bridge_incident,UnsortedIntervals,SortedIntervals).

generate_neg_marco_polo_bridge_incident_aux() :- sort_marco_polo_bridge_incident(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_marco_polo_bridge_incident(NegatedIntervals).

neg_marco_polo_bridge_incident_at_1563(Res) :- setof((Start,End),neg_marco_polo_bridge_incident(Start,End),AllINtervals), checkvalidity(1563,AllINtervals,Res).

check_query() :- write('Query = neg_marco_polo_bridge_incident_at_1563'), (neg_marco_polo_bridge_incident_at_1563(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_marco_polo_bridge_incident_aux().

