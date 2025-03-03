:- include('database.pl').
world_war_ii(Start,End) :- begin('world_war_ii',_,_,Start), end('world_war_ii',_,_,End), Start=<End.

ev___d__ghetto(Start,End) :- begin('ev___d__ghetto',_,_,Start), end('ev___d__ghetto',_,_,End), Start=<End.

generate_facts_world_war_ii_OR_ev___d__ghetto([]) :- assert(world_war_ii_OR_ev___d__ghetto(-1,-1)).

generate_facts_world_war_ii_OR_ev___d__ghetto([(Start,End) | Tail]) :- assert(world_war_ii_OR_ev___d__ghetto(Start,End)), generate_facts_world_war_ii_OR_ev___d__ghetto(Tail).

world_war_ii_OR_ev___d__ghetto_aux() :- findall((Start,End),world_war_ii(Start,End),Interval1), findall((Start,End),ev___d__ghetto(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_world_war_ii_OR_ev___d__ghetto(Interval).

world_war_ii_OR_ev___d__ghetto_at_1892(Res) :- setof((Start,End),world_war_ii_OR_ev___d__ghetto(Start,End),AllINtervals), checkvalidity(1892,AllINtervals,Res).

check_query() :- write('Query = world_war_ii_OR_ev___d__ghetto_at_1892'), (world_war_ii_OR_ev___d__ghetto_at_1892(true) -> write('\nRes   = true');write('\nRes   = false')).
?- world_war_ii_OR_ev___d__ghetto_aux().

