:- include('database.pl').
sh_wa_era(Start,End) :- begin('sh_wa_era',_,_,Start), end('sh_wa_era',_,_,End), Start=<End.

third_battle_of_kharkov(Start,End) :- begin('third_battle_of_kharkov',_,_,Start), end('third_battle_of_kharkov',_,_,End), Start=<End.

generate_facts_sh_wa_era_OR_third_battle_of_kharkov([]) :- assert(sh_wa_era_OR_third_battle_of_kharkov(-1,-1)).

generate_facts_sh_wa_era_OR_third_battle_of_kharkov([(Start,End) | Tail]) :- assert(sh_wa_era_OR_third_battle_of_kharkov(Start,End)), generate_facts_sh_wa_era_OR_third_battle_of_kharkov(Tail).

sh_wa_era_OR_third_battle_of_kharkov_aux() :- findall((Start,End),sh_wa_era(Start,End),Interval1), findall((Start,End),third_battle_of_kharkov(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_sh_wa_era_OR_third_battle_of_kharkov(Interval).

sh_wa_era_OR_third_battle_of_kharkov_at_1926(Res) :- setof((Start,End),sh_wa_era_OR_third_battle_of_kharkov(Start,End),AllINtervals), checkvalidity(1926,AllINtervals,Res).

check_query() :- write('Query = sh_wa_era_OR_third_battle_of_kharkov_at_1926'), (sh_wa_era_OR_third_battle_of_kharkov_at_1926(true) -> write('\nRes   = true');write('\nRes   = false')).
?- sh_wa_era_OR_third_battle_of_kharkov_aux().

