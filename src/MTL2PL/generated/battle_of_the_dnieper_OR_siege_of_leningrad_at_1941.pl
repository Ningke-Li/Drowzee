:- include('database.pl').
battle_of_the_dnieper(Start,End) :- begin('battle_of_the_dnieper',_,_,Start), end('battle_of_the_dnieper',_,_,End), Start=<End.

siege_of_leningrad(Start,End) :- begin('siege_of_leningrad',_,_,Start), end('siege_of_leningrad',_,_,End), Start=<End.

generate_facts_battle_of_the_dnieper_OR_siege_of_leningrad([]) :- assert(battle_of_the_dnieper_OR_siege_of_leningrad(-1,-1)).

generate_facts_battle_of_the_dnieper_OR_siege_of_leningrad([(Start,End) | Tail]) :- assert(battle_of_the_dnieper_OR_siege_of_leningrad(Start,End)), generate_facts_battle_of_the_dnieper_OR_siege_of_leningrad(Tail).

battle_of_the_dnieper_OR_siege_of_leningrad_aux() :- findall((Start,End),battle_of_the_dnieper(Start,End),Interval1), findall((Start,End),siege_of_leningrad(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_battle_of_the_dnieper_OR_siege_of_leningrad(Interval).

battle_of_the_dnieper_OR_siege_of_leningrad_at_1941(Res) :- setof((Start,End),battle_of_the_dnieper_OR_siege_of_leningrad(Start,End),AllINtervals), checkvalidity(1941,AllINtervals,Res).

check_query() :- write('Query = battle_of_the_dnieper_OR_siege_of_leningrad_at_1941'), (battle_of_the_dnieper_OR_siege_of_leningrad_at_1941(true) -> write('\nRes   = true');write('\nRes   = false')).
?- battle_of_the_dnieper_OR_siege_of_leningrad_aux().

