:- include('database.pl').
battle_of_berlin(Start,End) :- begin('battle_of_berlin',_,_,Start), end('battle_of_berlin',_,_,End), Start=<End.

total_drama_island(Start,End) :- begin('total_drama_island',_,_,Start), end('total_drama_island',_,_,End), Start=<End.

generate_facts_battle_of_berlin_OR_total_drama_island([]) :- assert(battle_of_berlin_OR_total_drama_island(-1,-1)).

generate_facts_battle_of_berlin_OR_total_drama_island([(Start,End) | Tail]) :- assert(battle_of_berlin_OR_total_drama_island(Start,End)), generate_facts_battle_of_berlin_OR_total_drama_island(Tail).

battle_of_berlin_OR_total_drama_island_aux() :- findall((Start,End),battle_of_berlin(Start,End),Interval1), findall((Start,End),total_drama_island(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_battle_of_berlin_OR_total_drama_island(Interval).

battle_of_berlin_OR_total_drama_island_at_1929(Res) :- setof((Start,End),battle_of_berlin_OR_total_drama_island(Start,End),AllINtervals), checkvalidity(1929,AllINtervals,Res).

check_query() :- write('Query = battle_of_berlin_OR_total_drama_island_at_1929'), (battle_of_berlin_OR_total_drama_island_at_1929(true) -> write('\nRes   = true');write('\nRes   = false')).
?- battle_of_berlin_OR_total_drama_island_aux().

