:- include('database.pl').
belgian_franc(Start,End) :- begin('belgian_franc',_,_,Start), end('belgian_franc',_,_,End), Start=<End.

world_war_ii_in_yugoslavia(Start,End) :- begin('world_war_ii_in_yugoslavia',_,_,Start), end('world_war_ii_in_yugoslavia',_,_,End), Start=<End.

generate_facts_belgian_franc_AND_world_war_ii_in_yugoslavia([]) :- assert(belgian_franc_AND_world_war_ii_in_yugoslavia(-1,-1)).

generate_facts_belgian_franc_AND_world_war_ii_in_yugoslavia([(Start,End) | Tail]) :- assert(belgian_franc_AND_world_war_ii_in_yugoslavia(Start,End)), generate_facts_belgian_franc_AND_world_war_ii_in_yugoslavia(Tail).

belgian_franc_AND_world_war_ii_in_yugoslavia_aux() :- findall((Start,End),belgian_franc(Start,End),Interval1), findall((Start,End),world_war_ii_in_yugoslavia(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_belgian_franc_AND_world_war_ii_in_yugoslavia(Interval).

belgian_franc_AND_world_war_ii_in_yugoslavia_at_1945(Res) :- setof((Start,End),belgian_franc_AND_world_war_ii_in_yugoslavia(Start,End),AllINtervals), checkvalidity(1945,AllINtervals,Res).

check_query() :- write('Query = belgian_franc_AND_world_war_ii_in_yugoslavia_at_1945'), (belgian_franc_AND_world_war_ii_in_yugoslavia_at_1945(true) -> write('\nRes   = true');write('\nRes   = false')).
?- belgian_franc_AND_world_war_ii_in_yugoslavia_aux().

