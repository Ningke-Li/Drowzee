:- include('database.pl').
battle_of_l_tzen(Start,End) :- begin('battle_of_l_tzen',_,_,Start), end('battle_of_l_tzen',_,_,End), Start=<End.

war_of_the_quadruple_alliance(Start,End) :- begin('war_of_the_quadruple_alliance',_,_,Start), end('war_of_the_quadruple_alliance',_,_,End), Start=<End.

generate_facts_battle_of_l_tzen_OR_war_of_the_quadruple_alliance([]) :- assert(battle_of_l_tzen_OR_war_of_the_quadruple_alliance(-1,-1)).

generate_facts_battle_of_l_tzen_OR_war_of_the_quadruple_alliance([(Start,End) | Tail]) :- assert(battle_of_l_tzen_OR_war_of_the_quadruple_alliance(Start,End)), generate_facts_battle_of_l_tzen_OR_war_of_the_quadruple_alliance(Tail).

battle_of_l_tzen_OR_war_of_the_quadruple_alliance_aux() :- findall((Start,End),battle_of_l_tzen(Start,End),Interval1), findall((Start,End),war_of_the_quadruple_alliance(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_battle_of_l_tzen_OR_war_of_the_quadruple_alliance(Interval).

battle_of_l_tzen_OR_war_of_the_quadruple_alliance_at_1676(Res) :- setof((Start,End),battle_of_l_tzen_OR_war_of_the_quadruple_alliance(Start,End),AllINtervals), checkvalidity(1676,AllINtervals,Res).

check_query() :- write('Query = battle_of_l_tzen_OR_war_of_the_quadruple_alliance_at_1676'), (battle_of_l_tzen_OR_war_of_the_quadruple_alliance_at_1676(true) -> write('\nRes   = true');write('\nRes   = false')).
?- battle_of_l_tzen_OR_war_of_the_quadruple_alliance_aux().

