:- include('database.pl').
total_drama_island(Start,End) :- begin('total_drama_island',_,_,Start), end('total_drama_island',_,_,End), Start=<End.

ev_1941(Start,End) :- begin('ev_1941',_,_,Start), end('ev_1941',_,_,End), Start=<End.

generate_facts_total_drama_island_OR_ev_1941([]) :- assert(total_drama_island_OR_ev_1941(-1,-1)).

generate_facts_total_drama_island_OR_ev_1941([(Start,End) | Tail]) :- assert(total_drama_island_OR_ev_1941(Start,End)), generate_facts_total_drama_island_OR_ev_1941(Tail).

total_drama_island_OR_ev_1941_aux() :- findall((Start,End),total_drama_island(Start,End),Interval1), findall((Start,End),ev_1941(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_total_drama_island_OR_ev_1941(Interval).

total_drama_island_OR_ev_1941_at_2050(Res) :- setof((Start,End),total_drama_island_OR_ev_1941(Start,End),AllINtervals), checkvalidity(2050,AllINtervals,Res).

check_query() :- write('Query = total_drama_island_OR_ev_1941_at_2050'), (total_drama_island_OR_ev_1941_at_2050(true) -> write('\nRes   = true');write('\nRes   = false')).
?- total_drama_island_OR_ev_1941_aux().

