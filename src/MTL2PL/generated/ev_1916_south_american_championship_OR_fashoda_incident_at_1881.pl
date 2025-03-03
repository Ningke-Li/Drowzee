:- include('database.pl').
ev_1916_south_american_championship(Start,End) :- begin('ev_1916_south_american_championship',_,_,Start), end('ev_1916_south_american_championship',_,_,End), Start=<End.

fashoda_incident(Start,End) :- begin('fashoda_incident',_,_,Start), end('fashoda_incident',_,_,End), Start=<End.

generate_facts_ev_1916_south_american_championship_OR_fashoda_incident([]) :- assert(ev_1916_south_american_championship_OR_fashoda_incident(-1,-1)).

generate_facts_ev_1916_south_american_championship_OR_fashoda_incident([(Start,End) | Tail]) :- assert(ev_1916_south_american_championship_OR_fashoda_incident(Start,End)), generate_facts_ev_1916_south_american_championship_OR_fashoda_incident(Tail).

ev_1916_south_american_championship_OR_fashoda_incident_aux() :- findall((Start,End),ev_1916_south_american_championship(Start,End),Interval1), findall((Start,End),fashoda_incident(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_1916_south_american_championship_OR_fashoda_incident(Interval).

ev_1916_south_american_championship_OR_fashoda_incident_at_1881(Res) :- setof((Start,End),ev_1916_south_american_championship_OR_fashoda_incident(Start,End),AllINtervals), checkvalidity(1881,AllINtervals,Res).

check_query() :- write('Query = ev_1916_south_american_championship_OR_fashoda_incident_at_1881'), (ev_1916_south_american_championship_OR_fashoda_incident_at_1881(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_1916_south_american_championship_OR_fashoda_incident_aux().

