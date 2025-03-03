:- include('database.pl').
cretan_war_of_1645_1669(Start,End) :- begin('cretan_war_of_1645_1669',_,_,Start), end('cretan_war_of_1645_1669',_,_,End), Start=<End.

battle_of_the_somme(Start,End) :- begin('battle_of_the_somme',_,_,Start), end('battle_of_the_somme',_,_,End), Start=<End.

generate_facts_cretan_war_of_1645_1669_OR_battle_of_the_somme([]) :- assert(cretan_war_of_1645_1669_OR_battle_of_the_somme(-1,-1)).

generate_facts_cretan_war_of_1645_1669_OR_battle_of_the_somme([(Start,End) | Tail]) :- assert(cretan_war_of_1645_1669_OR_battle_of_the_somme(Start,End)), generate_facts_cretan_war_of_1645_1669_OR_battle_of_the_somme(Tail).

cretan_war_of_1645_1669_OR_battle_of_the_somme_aux() :- findall((Start,End),cretan_war_of_1645_1669(Start,End),Interval1), findall((Start,End),battle_of_the_somme(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_cretan_war_of_1645_1669_OR_battle_of_the_somme(Interval).

cretan_war_of_1645_1669_OR_battle_of_the_somme_at_1651(Res) :- setof((Start,End),cretan_war_of_1645_1669_OR_battle_of_the_somme(Start,End),AllINtervals), checkvalidity(1651,AllINtervals,Res).

check_query() :- write('Query = cretan_war_of_1645_1669_OR_battle_of_the_somme_at_1651'), (cretan_war_of_1645_1669_OR_battle_of_the_somme_at_1651(true) -> write('\nRes   = true');write('\nRes   = false')).
?- cretan_war_of_1645_1669_OR_battle_of_the_somme_aux().

