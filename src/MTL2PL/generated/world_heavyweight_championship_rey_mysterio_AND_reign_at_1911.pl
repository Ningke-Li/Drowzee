:- include('database.pl').
world_heavyweight_championship_rey_mysterio(Start,End) :- begin('world_heavyweight_championship_rey_mysterio',_,_,Start), end('world_heavyweight_championship_rey_mysterio',_,_,End), Start=<End.

reign(Start,End) :- begin('reign',_,_,Start), end('reign',_,_,End), Start=<End.

generate_facts_world_heavyweight_championship_rey_mysterio_AND_reign([]) :- assert(world_heavyweight_championship_rey_mysterio_AND_reign(-1,-1)).

generate_facts_world_heavyweight_championship_rey_mysterio_AND_reign([(Start,End) | Tail]) :- assert(world_heavyweight_championship_rey_mysterio_AND_reign(Start,End)), generate_facts_world_heavyweight_championship_rey_mysterio_AND_reign(Tail).

world_heavyweight_championship_rey_mysterio_AND_reign_aux() :- findall((Start,End),world_heavyweight_championship_rey_mysterio(Start,End),Interval1), findall((Start,End),reign(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_world_heavyweight_championship_rey_mysterio_AND_reign(Interval).

world_heavyweight_championship_rey_mysterio_AND_reign_at_1911(Res) :- setof((Start,End),world_heavyweight_championship_rey_mysterio_AND_reign(Start,End),AllINtervals), checkvalidity(1911,AllINtervals,Res).

check_query() :- write('Query = world_heavyweight_championship_rey_mysterio_AND_reign_at_1911'), (world_heavyweight_championship_rey_mysterio_AND_reign_at_1911(true) -> write('\nRes   = true');write('\nRes   = false')).
?- world_heavyweight_championship_rey_mysterio_AND_reign_aux().

