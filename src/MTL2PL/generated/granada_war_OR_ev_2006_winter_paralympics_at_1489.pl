:- include('database.pl').
granada_war(Start,End) :- begin('granada_war',_,_,Start), end('granada_war',_,_,End), Start=<End.

ev_2006_winter_paralympics(Start,End) :- begin('ev_2006_winter_paralympics',_,_,Start), end('ev_2006_winter_paralympics',_,_,End), Start=<End.

generate_facts_granada_war_OR_ev_2006_winter_paralympics([]) :- assert(granada_war_OR_ev_2006_winter_paralympics(-1,-1)).

generate_facts_granada_war_OR_ev_2006_winter_paralympics([(Start,End) | Tail]) :- assert(granada_war_OR_ev_2006_winter_paralympics(Start,End)), generate_facts_granada_war_OR_ev_2006_winter_paralympics(Tail).

granada_war_OR_ev_2006_winter_paralympics_aux() :- findall((Start,End),granada_war(Start,End),Interval1), findall((Start,End),ev_2006_winter_paralympics(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_granada_war_OR_ev_2006_winter_paralympics(Interval).

granada_war_OR_ev_2006_winter_paralympics_at_1489(Res) :- setof((Start,End),granada_war_OR_ev_2006_winter_paralympics(Start,End),AllINtervals), checkvalidity(1489,AllINtervals,Res).

check_query() :- write('Query = granada_war_OR_ev_2006_winter_paralympics_at_1489'), (granada_war_OR_ev_2006_winter_paralympics_at_1489(true) -> write('\nRes   = true');write('\nRes   = false')).
?- granada_war_OR_ev_2006_winter_paralympics_aux().

