:- include('database.pl').
ev_2005_world_championships_in_athletics(Start,End) :- begin('ev_2005_world_championships_in_athletics',_,_,Start), end('ev_2005_world_championships_in_athletics',_,_,End), Start=<End.

lithuanian_litas(Start,End) :- begin('lithuanian_litas',_,_,Start), end('lithuanian_litas',_,_,End), Start=<End.

generate_facts_ev_2005_world_championships_in_athletics_OR_lithuanian_litas([]) :- assert(ev_2005_world_championships_in_athletics_OR_lithuanian_litas(-1,-1)).

generate_facts_ev_2005_world_championships_in_athletics_OR_lithuanian_litas([(Start,End) | Tail]) :- assert(ev_2005_world_championships_in_athletics_OR_lithuanian_litas(Start,End)), generate_facts_ev_2005_world_championships_in_athletics_OR_lithuanian_litas(Tail).

ev_2005_world_championships_in_athletics_OR_lithuanian_litas_aux() :- findall((Start,End),ev_2005_world_championships_in_athletics(Start,End),Interval1), findall((Start,End),lithuanian_litas(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2005_world_championships_in_athletics_OR_lithuanian_litas(Interval).

ev_2005_world_championships_in_athletics_OR_lithuanian_litas_at_1990(Res) :- setof((Start,End),ev_2005_world_championships_in_athletics_OR_lithuanian_litas(Start,End),AllINtervals), checkvalidity(1990,AllINtervals,Res).

check_query() :- write('Query = ev_2005_world_championships_in_athletics_OR_lithuanian_litas_at_1990'), (ev_2005_world_championships_in_athletics_OR_lithuanian_litas_at_1990(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2005_world_championships_in_athletics_OR_lithuanian_litas_aux().

