:- include('database.pl').
ev_2010_copiap__mining_accident(Start,End) :- begin('ev_2010_copiap__mining_accident',_,_,Start), end('ev_2010_copiap__mining_accident',_,_,End), Start=<End.

irish_rebellion_of_1798(Start,End) :- begin('irish_rebellion_of_1798',_,_,Start), end('irish_rebellion_of_1798',_,_,End), Start=<End.

generate_facts_ev_2010_copiap__mining_accident_OR_irish_rebellion_of_1798([]) :- assert(ev_2010_copiap__mining_accident_OR_irish_rebellion_of_1798(-1,-1)).

generate_facts_ev_2010_copiap__mining_accident_OR_irish_rebellion_of_1798([(Start,End) | Tail]) :- assert(ev_2010_copiap__mining_accident_OR_irish_rebellion_of_1798(Start,End)), generate_facts_ev_2010_copiap__mining_accident_OR_irish_rebellion_of_1798(Tail).

ev_2010_copiap__mining_accident_OR_irish_rebellion_of_1798_aux() :- findall((Start,End),ev_2010_copiap__mining_accident(Start,End),Interval1), findall((Start,End),irish_rebellion_of_1798(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2010_copiap__mining_accident_OR_irish_rebellion_of_1798(Interval).

ev_2010_copiap__mining_accident_OR_irish_rebellion_of_1798_at_1794(Res) :- setof((Start,End),ev_2010_copiap__mining_accident_OR_irish_rebellion_of_1798(Start,End),AllINtervals), checkvalidity(1794,AllINtervals,Res).

check_query() :- write('Query = ev_2010_copiap__mining_accident_OR_irish_rebellion_of_1798_at_1794'), (ev_2010_copiap__mining_accident_OR_irish_rebellion_of_1798_at_1794(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2010_copiap__mining_accident_OR_irish_rebellion_of_1798_aux().

