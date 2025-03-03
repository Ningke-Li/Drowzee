:- include('database.pl').
hurricane_matthew(Start,End) :- begin('hurricane_matthew',_,_,Start), end('hurricane_matthew',_,_,End), Start=<End.

ev_2006_winter_paralympics(Start,End) :- begin('ev_2006_winter_paralympics',_,_,Start), end('ev_2006_winter_paralympics',_,_,End), Start=<End.

generate_facts_hurricane_matthew_OR_ev_2006_winter_paralympics([]) :- assert(hurricane_matthew_OR_ev_2006_winter_paralympics(-1,-1)).

generate_facts_hurricane_matthew_OR_ev_2006_winter_paralympics([(Start,End) | Tail]) :- assert(hurricane_matthew_OR_ev_2006_winter_paralympics(Start,End)), generate_facts_hurricane_matthew_OR_ev_2006_winter_paralympics(Tail).

hurricane_matthew_OR_ev_2006_winter_paralympics_aux() :- findall((Start,End),hurricane_matthew(Start,End),Interval1), findall((Start,End),ev_2006_winter_paralympics(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_hurricane_matthew_OR_ev_2006_winter_paralympics(Interval).

hurricane_matthew_OR_ev_2006_winter_paralympics_at_2046(Res) :- setof((Start,End),hurricane_matthew_OR_ev_2006_winter_paralympics(Start,End),AllINtervals), checkvalidity(2046,AllINtervals,Res).

check_query() :- write('Query = hurricane_matthew_OR_ev_2006_winter_paralympics_at_2046'), (hurricane_matthew_OR_ev_2006_winter_paralympics_at_2046(true) -> write('\nRes   = true');write('\nRes   = false')).
?- hurricane_matthew_OR_ev_2006_winter_paralympics_aux().

