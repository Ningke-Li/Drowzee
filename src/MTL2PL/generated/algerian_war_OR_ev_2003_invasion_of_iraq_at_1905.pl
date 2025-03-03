:- include('database.pl').
algerian_war(Start,End) :- begin('algerian_war',_,_,Start), end('algerian_war',_,_,End), Start=<End.

ev_2003_invasion_of_iraq(Start,End) :- begin('ev_2003_invasion_of_iraq',_,_,Start), end('ev_2003_invasion_of_iraq',_,_,End), Start=<End.

generate_facts_algerian_war_OR_ev_2003_invasion_of_iraq([]) :- assert(algerian_war_OR_ev_2003_invasion_of_iraq(-1,-1)).

generate_facts_algerian_war_OR_ev_2003_invasion_of_iraq([(Start,End) | Tail]) :- assert(algerian_war_OR_ev_2003_invasion_of_iraq(Start,End)), generate_facts_algerian_war_OR_ev_2003_invasion_of_iraq(Tail).

algerian_war_OR_ev_2003_invasion_of_iraq_aux() :- findall((Start,End),algerian_war(Start,End),Interval1), findall((Start,End),ev_2003_invasion_of_iraq(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_algerian_war_OR_ev_2003_invasion_of_iraq(Interval).

algerian_war_OR_ev_2003_invasion_of_iraq_at_1905(Res) :- setof((Start,End),algerian_war_OR_ev_2003_invasion_of_iraq(Start,End),AllINtervals), checkvalidity(1905,AllINtervals,Res).

check_query() :- write('Query = algerian_war_OR_ev_2003_invasion_of_iraq_at_1905'), (algerian_war_OR_ev_2003_invasion_of_iraq_at_1905(true) -> write('\nRes   = true');write('\nRes   = false')).
?- algerian_war_OR_ev_2003_invasion_of_iraq_aux().

