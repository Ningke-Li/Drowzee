:- include('database.pl').
world_heavyweight_championship_rey_mysterio(Start,End) :- begin('world_heavyweight_championship_rey_mysterio',_,_,Start), end('world_heavyweight_championship_rey_mysterio',_,_,End), Start=<End.

game_of_thrones(Start,End) :- begin('game_of_thrones',_,_,Start), end('game_of_thrones',_,_,End), Start=<End.

generate_facts_world_heavyweight_championship_rey_mysterio_AND_game_of_thrones([]) :- assert(world_heavyweight_championship_rey_mysterio_AND_game_of_thrones(-1,-1)).

generate_facts_world_heavyweight_championship_rey_mysterio_AND_game_of_thrones([(Start,End) | Tail]) :- assert(world_heavyweight_championship_rey_mysterio_AND_game_of_thrones(Start,End)), generate_facts_world_heavyweight_championship_rey_mysterio_AND_game_of_thrones(Tail).

world_heavyweight_championship_rey_mysterio_AND_game_of_thrones_aux() :- findall((Start,End),world_heavyweight_championship_rey_mysterio(Start,End),Interval1), findall((Start,End),game_of_thrones(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_world_heavyweight_championship_rey_mysterio_AND_game_of_thrones(Interval).

world_heavyweight_championship_rey_mysterio_AND_game_of_thrones_at_1945(Res) :- setof((Start,End),world_heavyweight_championship_rey_mysterio_AND_game_of_thrones(Start,End),AllINtervals), checkvalidity(1945,AllINtervals,Res).

check_query() :- write('Query = world_heavyweight_championship_rey_mysterio_AND_game_of_thrones_at_1945'), (world_heavyweight_championship_rey_mysterio_AND_game_of_thrones_at_1945(true) -> write('\nRes   = true');write('\nRes   = false')).
?- world_heavyweight_championship_rey_mysterio_AND_game_of_thrones_aux().

