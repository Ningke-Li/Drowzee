:- include('database.pl').
siege_of_osaka(Start,End) :- begin('siege_of_osaka',_,_,Start), end('siege_of_osaka',_,_,End), Start=<End.

cold_war(Start,End) :- begin('cold_war',_,_,Start), end('cold_war',_,_,End), Start=<End.

generate_facts_siege_of_osaka_OR_cold_war([]) :- assert(siege_of_osaka_OR_cold_war(-1,-1)).

generate_facts_siege_of_osaka_OR_cold_war([(Start,End) | Tail]) :- assert(siege_of_osaka_OR_cold_war(Start,End)), generate_facts_siege_of_osaka_OR_cold_war(Tail).

siege_of_osaka_OR_cold_war_aux() :- findall((Start,End),siege_of_osaka(Start,End),Interval1), findall((Start,End),cold_war(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_siege_of_osaka_OR_cold_war(Interval).

siege_of_osaka_OR_cold_war_at_1850(Res) :- setof((Start,End),siege_of_osaka_OR_cold_war(Start,End),AllINtervals), checkvalidity(1850,AllINtervals,Res).

check_query() :- write('Query = siege_of_osaka_OR_cold_war_at_1850'), (siege_of_osaka_OR_cold_war_at_1850(true) -> write('\nRes   = true');write('\nRes   = false')).
?- siege_of_osaka_OR_cold_war_aux().

