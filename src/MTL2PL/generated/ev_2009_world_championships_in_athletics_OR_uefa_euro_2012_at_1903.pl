:- include('database.pl').
ev_2009_world_championships_in_athletics(Start,End) :- begin('ev_2009_world_championships_in_athletics',_,_,Start), end('ev_2009_world_championships_in_athletics',_,_,End), Start=<End.

uefa_euro_2012(Start,End) :- begin('uefa_euro_2012',_,_,Start), end('uefa_euro_2012',_,_,End), Start=<End.

generate_facts_ev_2009_world_championships_in_athletics_OR_uefa_euro_2012([]) :- assert(ev_2009_world_championships_in_athletics_OR_uefa_euro_2012(-1,-1)).

generate_facts_ev_2009_world_championships_in_athletics_OR_uefa_euro_2012([(Start,End) | Tail]) :- assert(ev_2009_world_championships_in_athletics_OR_uefa_euro_2012(Start,End)), generate_facts_ev_2009_world_championships_in_athletics_OR_uefa_euro_2012(Tail).

ev_2009_world_championships_in_athletics_OR_uefa_euro_2012_aux() :- findall((Start,End),ev_2009_world_championships_in_athletics(Start,End),Interval1), findall((Start,End),uefa_euro_2012(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2009_world_championships_in_athletics_OR_uefa_euro_2012(Interval).

ev_2009_world_championships_in_athletics_OR_uefa_euro_2012_at_1903(Res) :- setof((Start,End),ev_2009_world_championships_in_athletics_OR_uefa_euro_2012(Start,End),AllINtervals), checkvalidity(1903,AllINtervals,Res).

check_query() :- write('Query = ev_2009_world_championships_in_athletics_OR_uefa_euro_2012_at_1903'), (ev_2009_world_championships_in_athletics_OR_uefa_euro_2012_at_1903(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2009_world_championships_in_athletics_OR_uefa_euro_2012_aux().

