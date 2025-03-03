:- include('database.pl').
battle_of_h_rtgen_forest(Start,End) :- begin('battle_of_h_rtgen_forest',_,_,Start), end('battle_of_h_rtgen_forest',_,_,End), Start=<End.

battle_of_h_rtgen_forest(Start,End) :- begin('battle_of_h_rtgen_forest',_,_,Start), end('battle_of_h_rtgen_forest',_,_,End), Start=<End.

generate_facts_battle_of_h_rtgen_forest_AND_battle_of_h_rtgen_forest([]) :- assert(battle_of_h_rtgen_forest_AND_battle_of_h_rtgen_forest(-1,-1)).

generate_facts_battle_of_h_rtgen_forest_AND_battle_of_h_rtgen_forest([(Start,End) | Tail]) :- assert(battle_of_h_rtgen_forest_AND_battle_of_h_rtgen_forest(Start,End)), generate_facts_battle_of_h_rtgen_forest_AND_battle_of_h_rtgen_forest(Tail).

battle_of_h_rtgen_forest_AND_battle_of_h_rtgen_forest_aux() :- findall((Start,End),battle_of_h_rtgen_forest(Start,End),Interval1), findall((Start,End),battle_of_h_rtgen_forest(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_battle_of_h_rtgen_forest_AND_battle_of_h_rtgen_forest(Interval).

battle_of_h_rtgen_forest_AND_battle_of_h_rtgen_forest_at_1945(Res) :- setof((Start,End),battle_of_h_rtgen_forest_AND_battle_of_h_rtgen_forest(Start,End),AllINtervals), checkvalidity(1945,AllINtervals,Res).

check_query() :- write('Query = battle_of_h_rtgen_forest_AND_battle_of_h_rtgen_forest_at_1945'), (battle_of_h_rtgen_forest_AND_battle_of_h_rtgen_forest_at_1945(true) -> write('\nRes   = true');write('\nRes   = false')).
?- battle_of_h_rtgen_forest_AND_battle_of_h_rtgen_forest_aux().

