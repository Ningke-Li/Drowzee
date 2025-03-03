:- include('database.pl').
hurricane_irene(Start,End) :- begin('hurricane_irene',_,_,Start), end('hurricane_irene',_,_,End), Start=<End.

fashoda_incident(Start,End) :- begin('fashoda_incident',_,_,Start), end('fashoda_incident',_,_,End), Start=<End.

generate_facts_hurricane_irene_OR_fashoda_incident([]) :- assert(hurricane_irene_OR_fashoda_incident(-1,-1)).

generate_facts_hurricane_irene_OR_fashoda_incident([(Start,End) | Tail]) :- assert(hurricane_irene_OR_fashoda_incident(Start,End)), generate_facts_hurricane_irene_OR_fashoda_incident(Tail).

hurricane_irene_OR_fashoda_incident_aux() :- findall((Start,End),hurricane_irene(Start,End),Interval1), findall((Start,End),fashoda_incident(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_hurricane_irene_OR_fashoda_incident(Interval).

hurricane_irene_OR_fashoda_incident_at_1817(Res) :- setof((Start,End),hurricane_irene_OR_fashoda_incident(Start,End),AllINtervals), checkvalidity(1817,AllINtervals,Res).

check_query() :- write('Query = hurricane_irene_OR_fashoda_incident_at_1817'), (hurricane_irene_OR_fashoda_incident_at_1817(true) -> write('\nRes   = true');write('\nRes   = false')).
?- hurricane_irene_OR_fashoda_incident_aux().

