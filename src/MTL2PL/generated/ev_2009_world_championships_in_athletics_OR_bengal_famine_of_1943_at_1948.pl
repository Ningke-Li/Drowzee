:- include('database.pl').
ev_2009_world_championships_in_athletics(Start,End) :- begin('ev_2009_world_championships_in_athletics',_,_,Start), end('ev_2009_world_championships_in_athletics',_,_,End), Start=<End.

bengal_famine_of_1943(Start,End) :- begin('bengal_famine_of_1943',_,_,Start), end('bengal_famine_of_1943',_,_,End), Start=<End.

generate_facts_ev_2009_world_championships_in_athletics_OR_bengal_famine_of_1943([]) :- assert(ev_2009_world_championships_in_athletics_OR_bengal_famine_of_1943(-1,-1)).

generate_facts_ev_2009_world_championships_in_athletics_OR_bengal_famine_of_1943([(Start,End) | Tail]) :- assert(ev_2009_world_championships_in_athletics_OR_bengal_famine_of_1943(Start,End)), generate_facts_ev_2009_world_championships_in_athletics_OR_bengal_famine_of_1943(Tail).

ev_2009_world_championships_in_athletics_OR_bengal_famine_of_1943_aux() :- findall((Start,End),ev_2009_world_championships_in_athletics(Start,End),Interval1), findall((Start,End),bengal_famine_of_1943(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2009_world_championships_in_athletics_OR_bengal_famine_of_1943(Interval).

ev_2009_world_championships_in_athletics_OR_bengal_famine_of_1943_at_1948(Res) :- setof((Start,End),ev_2009_world_championships_in_athletics_OR_bengal_famine_of_1943(Start,End),AllINtervals), checkvalidity(1948,AllINtervals,Res).

check_query() :- write('Query = ev_2009_world_championships_in_athletics_OR_bengal_famine_of_1943_at_1948'), (ev_2009_world_championships_in_athletics_OR_bengal_famine_of_1943_at_1948(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2009_world_championships_in_athletics_OR_bengal_famine_of_1943_aux().

