:- include('database.pl').
battle_of_li_ge(Start,End) :- begin('battle_of_li_ge',_,_,Start), end('battle_of_li_ge',_,_,End), Start=<End.

puella_magi_madoka_magica(Start,End) :- begin('puella_magi_madoka_magica',_,_,Start), end('puella_magi_madoka_magica',_,_,End), Start=<End.

generate_facts_battle_of_li_ge_OR_puella_magi_madoka_magica([]) :- assert(battle_of_li_ge_OR_puella_magi_madoka_magica(-1,-1)).

generate_facts_battle_of_li_ge_OR_puella_magi_madoka_magica([(Start,End) | Tail]) :- assert(battle_of_li_ge_OR_puella_magi_madoka_magica(Start,End)), generate_facts_battle_of_li_ge_OR_puella_magi_madoka_magica(Tail).

battle_of_li_ge_OR_puella_magi_madoka_magica_aux() :- findall((Start,End),battle_of_li_ge(Start,End),Interval1), findall((Start,End),puella_magi_madoka_magica(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_battle_of_li_ge_OR_puella_magi_madoka_magica(Interval).

battle_of_li_ge_OR_puella_magi_madoka_magica_at_1903(Res) :- setof((Start,End),battle_of_li_ge_OR_puella_magi_madoka_magica(Start,End),AllINtervals), checkvalidity(1903,AllINtervals,Res).

check_query() :- write('Query = battle_of_li_ge_OR_puella_magi_madoka_magica_at_1903'), (battle_of_li_ge_OR_puella_magi_madoka_magica_at_1903(true) -> write('\nRes   = true');write('\nRes   = false')).
?- battle_of_li_ge_OR_puella_magi_madoka_magica_aux().

