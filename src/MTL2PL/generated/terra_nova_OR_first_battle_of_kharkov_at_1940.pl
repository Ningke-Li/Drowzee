:- include('database.pl').
terra_nova(Start,End) :- begin('terra_nova',_,_,Start), end('terra_nova',_,_,End), Start=<End.

first_battle_of_kharkov(Start,End) :- begin('first_battle_of_kharkov',_,_,Start), end('first_battle_of_kharkov',_,_,End), Start=<End.

generate_facts_terra_nova_OR_first_battle_of_kharkov([]) :- assert(terra_nova_OR_first_battle_of_kharkov(-1,-1)).

generate_facts_terra_nova_OR_first_battle_of_kharkov([(Start,End) | Tail]) :- assert(terra_nova_OR_first_battle_of_kharkov(Start,End)), generate_facts_terra_nova_OR_first_battle_of_kharkov(Tail).

terra_nova_OR_first_battle_of_kharkov_aux() :- findall((Start,End),terra_nova(Start,End),Interval1), findall((Start,End),first_battle_of_kharkov(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_terra_nova_OR_first_battle_of_kharkov(Interval).

terra_nova_OR_first_battle_of_kharkov_at_1940(Res) :- setof((Start,End),terra_nova_OR_first_battle_of_kharkov(Start,End),AllINtervals), checkvalidity(1940,AllINtervals,Res).

check_query() :- write('Query = terra_nova_OR_first_battle_of_kharkov_at_1940'), (terra_nova_OR_first_battle_of_kharkov_at_1940(true) -> write('\nRes   = true');write('\nRes   = false')).
?- terra_nova_OR_first_battle_of_kharkov_aux().

