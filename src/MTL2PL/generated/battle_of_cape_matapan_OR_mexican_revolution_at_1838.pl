:- include('database.pl').
battle_of_cape_matapan(Start,End) :- begin('battle_of_cape_matapan',_,_,Start), end('battle_of_cape_matapan',_,_,End), Start=<End.

mexican_revolution(Start,End) :- begin('mexican_revolution',_,_,Start), end('mexican_revolution',_,_,End), Start=<End.

generate_facts_battle_of_cape_matapan_OR_mexican_revolution([]) :- assert(battle_of_cape_matapan_OR_mexican_revolution(-1,-1)).

generate_facts_battle_of_cape_matapan_OR_mexican_revolution([(Start,End) | Tail]) :- assert(battle_of_cape_matapan_OR_mexican_revolution(Start,End)), generate_facts_battle_of_cape_matapan_OR_mexican_revolution(Tail).

battle_of_cape_matapan_OR_mexican_revolution_aux() :- findall((Start,End),battle_of_cape_matapan(Start,End),Interval1), findall((Start,End),mexican_revolution(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_battle_of_cape_matapan_OR_mexican_revolution(Interval).

battle_of_cape_matapan_OR_mexican_revolution_at_1838(Res) :- setof((Start,End),battle_of_cape_matapan_OR_mexican_revolution(Start,End),AllINtervals), checkvalidity(1838,AllINtervals,Res).

check_query() :- write('Query = battle_of_cape_matapan_OR_mexican_revolution_at_1838'), (battle_of_cape_matapan_OR_mexican_revolution_at_1838(true) -> write('\nRes   = true');write('\nRes   = false')).
?- battle_of_cape_matapan_OR_mexican_revolution_aux().

