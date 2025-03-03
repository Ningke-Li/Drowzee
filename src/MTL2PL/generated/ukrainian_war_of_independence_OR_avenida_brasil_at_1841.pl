:- include('database.pl').
ukrainian_war_of_independence(Start,End) :- begin('ukrainian_war_of_independence',_,_,Start), end('ukrainian_war_of_independence',_,_,End), Start=<End.

avenida_brasil(Start,End) :- begin('avenida_brasil',_,_,Start), end('avenida_brasil',_,_,End), Start=<End.

generate_facts_ukrainian_war_of_independence_OR_avenida_brasil([]) :- assert(ukrainian_war_of_independence_OR_avenida_brasil(-1,-1)).

generate_facts_ukrainian_war_of_independence_OR_avenida_brasil([(Start,End) | Tail]) :- assert(ukrainian_war_of_independence_OR_avenida_brasil(Start,End)), generate_facts_ukrainian_war_of_independence_OR_avenida_brasil(Tail).

ukrainian_war_of_independence_OR_avenida_brasil_aux() :- findall((Start,End),ukrainian_war_of_independence(Start,End),Interval1), findall((Start,End),avenida_brasil(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ukrainian_war_of_independence_OR_avenida_brasil(Interval).

ukrainian_war_of_independence_OR_avenida_brasil_at_1841(Res) :- setof((Start,End),ukrainian_war_of_independence_OR_avenida_brasil(Start,End),AllINtervals), checkvalidity(1841,AllINtervals,Res).

check_query() :- write('Query = ukrainian_war_of_independence_OR_avenida_brasil_at_1841'), (ukrainian_war_of_independence_OR_avenida_brasil_at_1841(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ukrainian_war_of_independence_OR_avenida_brasil_aux().

