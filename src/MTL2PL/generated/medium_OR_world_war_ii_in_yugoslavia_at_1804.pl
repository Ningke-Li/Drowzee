:- include('database.pl').
medium(Start,End) :- begin('medium',_,_,Start), end('medium',_,_,End), Start=<End.

world_war_ii_in_yugoslavia(Start,End) :- begin('world_war_ii_in_yugoslavia',_,_,Start), end('world_war_ii_in_yugoslavia',_,_,End), Start=<End.

generate_facts_medium_OR_world_war_ii_in_yugoslavia([]) :- assert(medium_OR_world_war_ii_in_yugoslavia(-1,-1)).

generate_facts_medium_OR_world_war_ii_in_yugoslavia([(Start,End) | Tail]) :- assert(medium_OR_world_war_ii_in_yugoslavia(Start,End)), generate_facts_medium_OR_world_war_ii_in_yugoslavia(Tail).

medium_OR_world_war_ii_in_yugoslavia_aux() :- findall((Start,End),medium(Start,End),Interval1), findall((Start,End),world_war_ii_in_yugoslavia(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_medium_OR_world_war_ii_in_yugoslavia(Interval).

medium_OR_world_war_ii_in_yugoslavia_at_1804(Res) :- setof((Start,End),medium_OR_world_war_ii_in_yugoslavia(Start,End),AllINtervals), checkvalidity(1804,AllINtervals,Res).

check_query() :- write('Query = medium_OR_world_war_ii_in_yugoslavia_at_1804'), (medium_OR_world_war_ii_in_yugoslavia_at_1804(true) -> write('\nRes   = true');write('\nRes   = false')).
?- medium_OR_world_war_ii_in_yugoslavia_aux().

