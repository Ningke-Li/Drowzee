:- include('database.pl').
ray_william_johnson(Start,End) :- begin('ray_william_johnson',_,_,Start), end('ray_william_johnson',_,_,End), Start=<End.

world_heavyweight_championship_rey_mysterio(Start,End) :- begin('world_heavyweight_championship_rey_mysterio',_,_,Start), end('world_heavyweight_championship_rey_mysterio',_,_,End), Start=<End.

generate_facts_ray_william_johnson_AND_world_heavyweight_championship_rey_mysterio([]) :- assert(ray_william_johnson_AND_world_heavyweight_championship_rey_mysterio(-1,-1)).

generate_facts_ray_william_johnson_AND_world_heavyweight_championship_rey_mysterio([(Start,End) | Tail]) :- assert(ray_william_johnson_AND_world_heavyweight_championship_rey_mysterio(Start,End)), generate_facts_ray_william_johnson_AND_world_heavyweight_championship_rey_mysterio(Tail).

ray_william_johnson_AND_world_heavyweight_championship_rey_mysterio_aux() :- findall((Start,End),ray_william_johnson(Start,End),Interval1), findall((Start,End),world_heavyweight_championship_rey_mysterio(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ray_william_johnson_AND_world_heavyweight_championship_rey_mysterio(Interval).

ray_william_johnson_AND_world_heavyweight_championship_rey_mysterio_at_1975(Res) :- setof((Start,End),ray_william_johnson_AND_world_heavyweight_championship_rey_mysterio(Start,End),AllINtervals), checkvalidity(1975,AllINtervals,Res).

check_query() :- write('Query = ray_william_johnson_AND_world_heavyweight_championship_rey_mysterio_at_1975'), (ray_william_johnson_AND_world_heavyweight_championship_rey_mysterio_at_1975(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ray_william_johnson_AND_world_heavyweight_championship_rey_mysterio_aux().

