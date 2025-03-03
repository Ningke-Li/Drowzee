:- include('database.pl').
congress_of_berlin(Start,End) :- begin('congress_of_berlin',_,_,Start), end('congress_of_berlin',_,_,End), Start=<End.

ev_2003_invasion_of_iraq(Start,End) :- begin('ev_2003_invasion_of_iraq',_,_,Start), end('ev_2003_invasion_of_iraq',_,_,End), Start=<End.

generate_facts_congress_of_berlin_OR_ev_2003_invasion_of_iraq([]) :- assert(congress_of_berlin_OR_ev_2003_invasion_of_iraq(-1,-1)).

generate_facts_congress_of_berlin_OR_ev_2003_invasion_of_iraq([(Start,End) | Tail]) :- assert(congress_of_berlin_OR_ev_2003_invasion_of_iraq(Start,End)), generate_facts_congress_of_berlin_OR_ev_2003_invasion_of_iraq(Tail).

congress_of_berlin_OR_ev_2003_invasion_of_iraq_aux() :- findall((Start,End),congress_of_berlin(Start,End),Interval1), findall((Start,End),ev_2003_invasion_of_iraq(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_congress_of_berlin_OR_ev_2003_invasion_of_iraq(Interval).

congress_of_berlin_OR_ev_2003_invasion_of_iraq_at_1878(Res) :- setof((Start,End),congress_of_berlin_OR_ev_2003_invasion_of_iraq(Start,End),AllINtervals), checkvalidity(1878,AllINtervals,Res).

check_query() :- write('Query = congress_of_berlin_OR_ev_2003_invasion_of_iraq_at_1878'), (congress_of_berlin_OR_ev_2003_invasion_of_iraq_at_1878(true) -> write('\nRes   = true');write('\nRes   = false')).
?- congress_of_berlin_OR_ev_2003_invasion_of_iraq_aux().

