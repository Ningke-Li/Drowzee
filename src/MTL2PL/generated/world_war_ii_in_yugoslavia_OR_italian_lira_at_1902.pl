:- include('database.pl').
world_war_ii_in_yugoslavia(Start,End) :- begin('world_war_ii_in_yugoslavia',_,_,Start), end('world_war_ii_in_yugoslavia',_,_,End), Start=<End.

italian_lira(Start,End) :- begin('italian_lira',_,_,Start), end('italian_lira',_,_,End), Start=<End.

generate_facts_world_war_ii_in_yugoslavia_OR_italian_lira([]) :- assert(world_war_ii_in_yugoslavia_OR_italian_lira(-1,-1)).

generate_facts_world_war_ii_in_yugoslavia_OR_italian_lira([(Start,End) | Tail]) :- assert(world_war_ii_in_yugoslavia_OR_italian_lira(Start,End)), generate_facts_world_war_ii_in_yugoslavia_OR_italian_lira(Tail).

world_war_ii_in_yugoslavia_OR_italian_lira_aux() :- findall((Start,End),world_war_ii_in_yugoslavia(Start,End),Interval1), findall((Start,End),italian_lira(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_world_war_ii_in_yugoslavia_OR_italian_lira(Interval).

world_war_ii_in_yugoslavia_OR_italian_lira_at_1902(Res) :- setof((Start,End),world_war_ii_in_yugoslavia_OR_italian_lira(Start,End),AllINtervals), checkvalidity(1902,AllINtervals,Res).

check_query() :- write('Query = world_war_ii_in_yugoslavia_OR_italian_lira_at_1902'), (world_war_ii_in_yugoslavia_OR_italian_lira_at_1902(true) -> write('\nRes   = true');write('\nRes   = false')).
?- world_war_ii_in_yugoslavia_OR_italian_lira_aux().

