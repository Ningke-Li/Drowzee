:- include('database.pl').
ev_2010_copiap__mining_accident(Start,End) :- begin('ev_2010_copiap__mining_accident',_,_,Start), end('ev_2010_copiap__mining_accident',_,_,End), Start=<End.

january_2015(Start,End) :- begin('january_2015',_,_,Start), end('january_2015',_,_,End), Start=<End.

generate_facts_ev_2010_copiap__mining_accident_OR_january_2015([]) :- assert(ev_2010_copiap__mining_accident_OR_january_2015(-1,-1)).

generate_facts_ev_2010_copiap__mining_accident_OR_january_2015([(Start,End) | Tail]) :- assert(ev_2010_copiap__mining_accident_OR_january_2015(Start,End)), generate_facts_ev_2010_copiap__mining_accident_OR_january_2015(Tail).

ev_2010_copiap__mining_accident_OR_january_2015_aux() :- findall((Start,End),ev_2010_copiap__mining_accident(Start,End),Interval1), findall((Start,End),january_2015(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2010_copiap__mining_accident_OR_january_2015(Interval).

ev_2010_copiap__mining_accident_OR_january_2015_at_1946(Res) :- setof((Start,End),ev_2010_copiap__mining_accident_OR_january_2015(Start,End),AllINtervals), checkvalidity(1946,AllINtervals,Res).

check_query() :- write('Query = ev_2010_copiap__mining_accident_OR_january_2015_at_1946'), (ev_2010_copiap__mining_accident_OR_january_2015_at_1946(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2010_copiap__mining_accident_OR_january_2015_aux().

