:- include('database.pl').
second_battle_of_kharkov(Start,End) :- begin('second_battle_of_kharkov',_,_,Start), end('second_battle_of_kharkov',_,_,End), Start=<End.

war_of_jenkins__ear(Start,End) :- begin('war_of_jenkins__ear',_,_,Start), end('war_of_jenkins__ear',_,_,End), Start=<End.

generate_facts_second_battle_of_kharkov_OR_war_of_jenkins__ear([]) :- assert(second_battle_of_kharkov_OR_war_of_jenkins__ear(-1,-1)).

generate_facts_second_battle_of_kharkov_OR_war_of_jenkins__ear([(Start,End) | Tail]) :- assert(second_battle_of_kharkov_OR_war_of_jenkins__ear(Start,End)), generate_facts_second_battle_of_kharkov_OR_war_of_jenkins__ear(Tail).

second_battle_of_kharkov_OR_war_of_jenkins__ear_aux() :- findall((Start,End),second_battle_of_kharkov(Start,End),Interval1), findall((Start,End),war_of_jenkins__ear(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_second_battle_of_kharkov_OR_war_of_jenkins__ear(Interval).

second_battle_of_kharkov_OR_war_of_jenkins__ear_at_1686(Res) :- setof((Start,End),second_battle_of_kharkov_OR_war_of_jenkins__ear(Start,End),AllINtervals), checkvalidity(1686,AllINtervals,Res).

check_query() :- write('Query = second_battle_of_kharkov_OR_war_of_jenkins__ear_at_1686'), (second_battle_of_kharkov_OR_war_of_jenkins__ear_at_1686(true) -> write('\nRes   = true');write('\nRes   = false')).
?- second_battle_of_kharkov_OR_war_of_jenkins__ear_aux().

