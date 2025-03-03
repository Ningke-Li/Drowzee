:- include('database.pl').
annexation_of_crimea_by_the_russian_federation(Start,End) :- begin('annexation_of_crimea_by_the_russian_federation',_,_,Start), end('annexation_of_crimea_by_the_russian_federation',_,_,End), Start=<End.

battle_of_taranto(Start,End) :- begin('battle_of_taranto',_,_,Start), end('battle_of_taranto',_,_,End), Start=<End.

generate_facts_annexation_of_crimea_by_the_russian_federation_OR_battle_of_taranto([]) :- assert(annexation_of_crimea_by_the_russian_federation_OR_battle_of_taranto(-1,-1)).

generate_facts_annexation_of_crimea_by_the_russian_federation_OR_battle_of_taranto([(Start,End) | Tail]) :- assert(annexation_of_crimea_by_the_russian_federation_OR_battle_of_taranto(Start,End)), generate_facts_annexation_of_crimea_by_the_russian_federation_OR_battle_of_taranto(Tail).

annexation_of_crimea_by_the_russian_federation_OR_battle_of_taranto_aux() :- findall((Start,End),annexation_of_crimea_by_the_russian_federation(Start,End),Interval1), findall((Start,End),battle_of_taranto(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_annexation_of_crimea_by_the_russian_federation_OR_battle_of_taranto(Interval).

annexation_of_crimea_by_the_russian_federation_OR_battle_of_taranto_at_1982(Res) :- setof((Start,End),annexation_of_crimea_by_the_russian_federation_OR_battle_of_taranto(Start,End),AllINtervals), checkvalidity(1982,AllINtervals,Res).

check_query() :- write('Query = annexation_of_crimea_by_the_russian_federation_OR_battle_of_taranto_at_1982'), (annexation_of_crimea_by_the_russian_federation_OR_battle_of_taranto_at_1982(true) -> write('\nRes   = true');write('\nRes   = false')).
?- annexation_of_crimea_by_the_russian_federation_OR_battle_of_taranto_aux().

