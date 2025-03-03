:- include('database.pl').
fashoda_incident(Start,End) :- begin('fashoda_incident',_,_,Start), end('fashoda_incident',_,_,End), Start=<End.

the_blacklist(Start,End) :- begin('the_blacklist',_,_,Start), end('the_blacklist',_,_,End), Start=<End.

generate_facts_fashoda_incident_OR_the_blacklist([]) :- assert(fashoda_incident_OR_the_blacklist(-1,-1)).

generate_facts_fashoda_incident_OR_the_blacklist([(Start,End) | Tail]) :- assert(fashoda_incident_OR_the_blacklist(Start,End)), generate_facts_fashoda_incident_OR_the_blacklist(Tail).

fashoda_incident_OR_the_blacklist_aux() :- findall((Start,End),fashoda_incident(Start,End),Interval1), findall((Start,End),the_blacklist(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_fashoda_incident_OR_the_blacklist(Interval).

fashoda_incident_OR_the_blacklist_at_1823(Res) :- setof((Start,End),fashoda_incident_OR_the_blacklist(Start,End),AllINtervals), checkvalidity(1823,AllINtervals,Res).

check_query() :- write('Query = fashoda_incident_OR_the_blacklist_at_1823'), (fashoda_incident_OR_the_blacklist_at_1823(true) -> write('\nRes   = true');write('\nRes   = false')).
?- fashoda_incident_OR_the_blacklist_aux().

