:- include('database.pl').
siege_of_budapest(Start,End) :- begin('siege_of_budapest',_,_,Start), end('siege_of_budapest',_,_,End), Start=<End.

portuguese_escudo(Start,End) :- begin('portuguese_escudo',_,_,Start), end('portuguese_escudo',_,_,End), Start=<End.

generate_facts_siege_of_budapest_OR_portuguese_escudo([]) :- assert(siege_of_budapest_OR_portuguese_escudo(-1,-1)).

generate_facts_siege_of_budapest_OR_portuguese_escudo([(Start,End) | Tail]) :- assert(siege_of_budapest_OR_portuguese_escudo(Start,End)), generate_facts_siege_of_budapest_OR_portuguese_escudo(Tail).

siege_of_budapest_OR_portuguese_escudo_aux() :- findall((Start,End),siege_of_budapest(Start,End),Interval1), findall((Start,End),portuguese_escudo(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_siege_of_budapest_OR_portuguese_escudo(Interval).

siege_of_budapest_OR_portuguese_escudo_at_1800(Res) :- setof((Start,End),siege_of_budapest_OR_portuguese_escudo(Start,End),AllINtervals), checkvalidity(1800,AllINtervals,Res).

check_query() :- write('Query = siege_of_budapest_OR_portuguese_escudo_at_1800'), (siege_of_budapest_OR_portuguese_escudo_at_1800(true) -> write('\nRes   = true');write('\nRes   = false')).
?- siege_of_budapest_OR_portuguese_escudo_aux().

