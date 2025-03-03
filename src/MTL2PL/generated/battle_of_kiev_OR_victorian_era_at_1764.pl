:- include('database.pl').
battle_of_kiev(Start,End) :- begin('battle_of_kiev',_,_,Start), end('battle_of_kiev',_,_,End), Start=<End.

victorian_era(Start,End) :- begin('victorian_era',_,_,Start), end('victorian_era',_,_,End), Start=<End.

generate_facts_battle_of_kiev_OR_victorian_era([]) :- assert(battle_of_kiev_OR_victorian_era(-1,-1)).

generate_facts_battle_of_kiev_OR_victorian_era([(Start,End) | Tail]) :- assert(battle_of_kiev_OR_victorian_era(Start,End)), generate_facts_battle_of_kiev_OR_victorian_era(Tail).

battle_of_kiev_OR_victorian_era_aux() :- findall((Start,End),battle_of_kiev(Start,End),Interval1), findall((Start,End),victorian_era(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_battle_of_kiev_OR_victorian_era(Interval).

battle_of_kiev_OR_victorian_era_at_1764(Res) :- setof((Start,End),battle_of_kiev_OR_victorian_era(Start,End),AllINtervals), checkvalidity(1764,AllINtervals,Res).

check_query() :- write('Query = battle_of_kiev_OR_victorian_era_at_1764'), (battle_of_kiev_OR_victorian_era_at_1764(true) -> write('\nRes   = true');write('\nRes   = false')).
?- battle_of_kiev_OR_victorian_era_aux().

