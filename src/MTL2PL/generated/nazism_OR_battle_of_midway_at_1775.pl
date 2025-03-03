:- include('database.pl').
nazism(Start,End) :- begin('nazism',_,_,Start), end('nazism',_,_,End), Start=<End.

battle_of_midway(Start,End) :- begin('battle_of_midway',_,_,Start), end('battle_of_midway',_,_,End), Start=<End.

generate_facts_nazism_OR_battle_of_midway([]) :- assert(nazism_OR_battle_of_midway(-1,-1)).

generate_facts_nazism_OR_battle_of_midway([(Start,End) | Tail]) :- assert(nazism_OR_battle_of_midway(Start,End)), generate_facts_nazism_OR_battle_of_midway(Tail).

nazism_OR_battle_of_midway_aux() :- findall((Start,End),nazism(Start,End),Interval1), findall((Start,End),battle_of_midway(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_nazism_OR_battle_of_midway(Interval).

nazism_OR_battle_of_midway_at_1775(Res) :- setof((Start,End),nazism_OR_battle_of_midway(Start,End),AllINtervals), checkvalidity(1775,AllINtervals,Res).

check_query() :- write('Query = nazism_OR_battle_of_midway_at_1775'), (nazism_OR_battle_of_midway_at_1775(true) -> write('\nRes   = true');write('\nRes   = false')).
?- nazism_OR_battle_of_midway_aux().

