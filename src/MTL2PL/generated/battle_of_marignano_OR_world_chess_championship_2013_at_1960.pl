:- include('database.pl').
battle_of_marignano(Start,End) :- begin('battle_of_marignano',_,_,Start), end('battle_of_marignano',_,_,End), Start=<End.

world_chess_championship_2013(Start,End) :- begin('world_chess_championship_2013',_,_,Start), end('world_chess_championship_2013',_,_,End), Start=<End.

generate_facts_battle_of_marignano_OR_world_chess_championship_2013([]) :- assert(battle_of_marignano_OR_world_chess_championship_2013(-1,-1)).

generate_facts_battle_of_marignano_OR_world_chess_championship_2013([(Start,End) | Tail]) :- assert(battle_of_marignano_OR_world_chess_championship_2013(Start,End)), generate_facts_battle_of_marignano_OR_world_chess_championship_2013(Tail).

battle_of_marignano_OR_world_chess_championship_2013_aux() :- findall((Start,End),battle_of_marignano(Start,End),Interval1), findall((Start,End),world_chess_championship_2013(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_battle_of_marignano_OR_world_chess_championship_2013(Interval).

battle_of_marignano_OR_world_chess_championship_2013_at_1960(Res) :- setof((Start,End),battle_of_marignano_OR_world_chess_championship_2013(Start,End),AllINtervals), checkvalidity(1960,AllINtervals,Res).

check_query() :- write('Query = battle_of_marignano_OR_world_chess_championship_2013_at_1960'), (battle_of_marignano_OR_world_chess_championship_2013_at_1960(true) -> write('\nRes   = true');write('\nRes   = false')).
?- battle_of_marignano_OR_world_chess_championship_2013_aux().

