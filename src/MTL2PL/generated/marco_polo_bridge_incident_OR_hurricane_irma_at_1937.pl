:- include('database.pl').
marco_polo_bridge_incident(Start,End) :- begin('marco_polo_bridge_incident',_,_,Start), end('marco_polo_bridge_incident',_,_,End), Start=<End.

hurricane_irma(Start,End) :- begin('hurricane_irma',_,_,Start), end('hurricane_irma',_,_,End), Start=<End.

generate_facts_marco_polo_bridge_incident_OR_hurricane_irma([]) :- assert(marco_polo_bridge_incident_OR_hurricane_irma(-1,-1)).

generate_facts_marco_polo_bridge_incident_OR_hurricane_irma([(Start,End) | Tail]) :- assert(marco_polo_bridge_incident_OR_hurricane_irma(Start,End)), generate_facts_marco_polo_bridge_incident_OR_hurricane_irma(Tail).

marco_polo_bridge_incident_OR_hurricane_irma_aux() :- findall((Start,End),marco_polo_bridge_incident(Start,End),Interval1), findall((Start,End),hurricane_irma(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_marco_polo_bridge_incident_OR_hurricane_irma(Interval).

marco_polo_bridge_incident_OR_hurricane_irma_at_1937(Res) :- setof((Start,End),marco_polo_bridge_incident_OR_hurricane_irma(Start,End),AllINtervals), checkvalidity(1937,AllINtervals,Res).

check_query() :- write('Query = marco_polo_bridge_incident_OR_hurricane_irma_at_1937'), (marco_polo_bridge_incident_OR_hurricane_irma_at_1937(true) -> write('\nRes   = true');write('\nRes   = false')).
?- marco_polo_bridge_incident_OR_hurricane_irma_aux().

