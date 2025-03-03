:- include('database.pl').
spanish_american_war(Start,End) :- begin('spanish_american_war',_,_,Start), end('spanish_american_war',_,_,End), Start=<End.

the_shield(Start,End) :- begin('the_shield',_,_,Start), end('the_shield',_,_,End), Start=<End.

generate_facts_spanish_american_war_OR_the_shield([]) :- assert(spanish_american_war_OR_the_shield(-1,-1)).

generate_facts_spanish_american_war_OR_the_shield([(Start,End) | Tail]) :- assert(spanish_american_war_OR_the_shield(Start,End)), generate_facts_spanish_american_war_OR_the_shield(Tail).

spanish_american_war_OR_the_shield_aux() :- findall((Start,End),spanish_american_war(Start,End),Interval1), findall((Start,End),the_shield(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_spanish_american_war_OR_the_shield(Interval).

spanish_american_war_OR_the_shield_at_1898(Res) :- setof((Start,End),spanish_american_war_OR_the_shield(Start,End),AllINtervals), checkvalidity(1898,AllINtervals,Res).

check_query() :- write('Query = spanish_american_war_OR_the_shield_at_1898'), (spanish_american_war_OR_the_shield_at_1898(true) -> write('\nRes   = true');write('\nRes   = false')).
?- spanish_american_war_OR_the_shield_aux().

