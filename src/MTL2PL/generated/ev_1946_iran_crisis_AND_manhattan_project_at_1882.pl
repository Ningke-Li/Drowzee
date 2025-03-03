:- include('database.pl').
ev_1946_iran_crisis(Start,End) :- begin('ev_1946_iran_crisis',_,_,Start), end('ev_1946_iran_crisis',_,_,End), Start=<End.

manhattan_project(Start,End) :- begin('manhattan_project',_,_,Start), end('manhattan_project',_,_,End), Start=<End.

generate_facts_ev_1946_iran_crisis_AND_manhattan_project([]) :- assert(ev_1946_iran_crisis_AND_manhattan_project(-1,-1)).

generate_facts_ev_1946_iran_crisis_AND_manhattan_project([(Start,End) | Tail]) :- assert(ev_1946_iran_crisis_AND_manhattan_project(Start,End)), generate_facts_ev_1946_iran_crisis_AND_manhattan_project(Tail).

ev_1946_iran_crisis_AND_manhattan_project_aux() :- findall((Start,End),ev_1946_iran_crisis(Start,End),Interval1), findall((Start,End),manhattan_project(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_1946_iran_crisis_AND_manhattan_project(Interval).

ev_1946_iran_crisis_AND_manhattan_project_at_1882(Res) :- setof((Start,End),ev_1946_iran_crisis_AND_manhattan_project(Start,End),AllINtervals), checkvalidity(1882,AllINtervals,Res).

check_query() :- write('Query = ev_1946_iran_crisis_AND_manhattan_project_at_1882'), (ev_1946_iran_crisis_AND_manhattan_project_at_1882(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_1946_iran_crisis_AND_manhattan_project_aux().

