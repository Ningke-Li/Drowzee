:- include('database.pl').
californication(Start,End) :- begin('californication',_,_,Start), end('californication',_,_,End), Start=<End.

world_heavyweight_championship_rey_mysterio(Start,End) :- begin('world_heavyweight_championship_rey_mysterio',_,_,Start), end('world_heavyweight_championship_rey_mysterio',_,_,End), Start=<End.

generate_facts_californication_AND_world_heavyweight_championship_rey_mysterio([]) :- assert(californication_AND_world_heavyweight_championship_rey_mysterio(-1,-1)).

generate_facts_californication_AND_world_heavyweight_championship_rey_mysterio([(Start,End) | Tail]) :- assert(californication_AND_world_heavyweight_championship_rey_mysterio(Start,End)), generate_facts_californication_AND_world_heavyweight_championship_rey_mysterio(Tail).

californication_AND_world_heavyweight_championship_rey_mysterio_aux() :- findall((Start,End),californication(Start,End),Interval1), findall((Start,End),world_heavyweight_championship_rey_mysterio(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_californication_AND_world_heavyweight_championship_rey_mysterio(Interval).

californication_AND_world_heavyweight_championship_rey_mysterio_at_1984(Res) :- setof((Start,End),californication_AND_world_heavyweight_championship_rey_mysterio(Start,End),AllINtervals), checkvalidity(1984,AllINtervals,Res).

check_query() :- write('Query = californication_AND_world_heavyweight_championship_rey_mysterio_at_1984'), (californication_AND_world_heavyweight_championship_rey_mysterio_at_1984(true) -> write('\nRes   = true');write('\nRes   = false')).
?- californication_AND_world_heavyweight_championship_rey_mysterio_aux().

