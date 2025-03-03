:- include('database.pl').
ev_1928_winter_olympics(Start,End) :- begin('ev_1928_winter_olympics',_,_,Start), end('ev_1928_winter_olympics',_,_,End), Start=<End.

manhattan_project(Start,End) :- begin('manhattan_project',_,_,Start), end('manhattan_project',_,_,End), Start=<End.

generate_facts_ev_1928_winter_olympics_OR_manhattan_project([]) :- assert(ev_1928_winter_olympics_OR_manhattan_project(-1,-1)).

generate_facts_ev_1928_winter_olympics_OR_manhattan_project([(Start,End) | Tail]) :- assert(ev_1928_winter_olympics_OR_manhattan_project(Start,End)), generate_facts_ev_1928_winter_olympics_OR_manhattan_project(Tail).

ev_1928_winter_olympics_OR_manhattan_project_aux() :- findall((Start,End),ev_1928_winter_olympics(Start,End),Interval1), findall((Start,End),manhattan_project(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_1928_winter_olympics_OR_manhattan_project(Interval).

ev_1928_winter_olympics_OR_manhattan_project_at_1849(Res) :- setof((Start,End),ev_1928_winter_olympics_OR_manhattan_project(Start,End),AllINtervals), checkvalidity(1849,AllINtervals,Res).

check_query() :- write('Query = ev_1928_winter_olympics_OR_manhattan_project_at_1849'), (ev_1928_winter_olympics_OR_manhattan_project_at_1849(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_1928_winter_olympics_OR_manhattan_project_aux().

