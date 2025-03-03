:- include('database.pl').
battle_of_the_coral_sea(Start,End) :- begin('battle_of_the_coral_sea',_,_,Start), end('battle_of_the_coral_sea',_,_,End), Start=<End.

battle_of_wagram(Start,End) :- begin('battle_of_wagram',_,_,Start), end('battle_of_wagram',_,_,End), Start=<End.

generate_facts_battle_of_the_coral_sea_OR_battle_of_wagram([]) :- assert(battle_of_the_coral_sea_OR_battle_of_wagram(-1,-1)).

generate_facts_battle_of_the_coral_sea_OR_battle_of_wagram([(Start,End) | Tail]) :- assert(battle_of_the_coral_sea_OR_battle_of_wagram(Start,End)), generate_facts_battle_of_the_coral_sea_OR_battle_of_wagram(Tail).

battle_of_the_coral_sea_OR_battle_of_wagram_aux() :- findall((Start,End),battle_of_the_coral_sea(Start,End),Interval1), findall((Start,End),battle_of_wagram(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_battle_of_the_coral_sea_OR_battle_of_wagram(Interval).

battle_of_the_coral_sea_OR_battle_of_wagram_at_1664(Res) :- setof((Start,End),battle_of_the_coral_sea_OR_battle_of_wagram(Start,End),AllINtervals), checkvalidity(1664,AllINtervals,Res).

check_query() :- write('Query = battle_of_the_coral_sea_OR_battle_of_wagram_at_1664'), (battle_of_the_coral_sea_OR_battle_of_wagram_at_1664(true) -> write('\nRes   = true');write('\nRes   = false')).
?- battle_of_the_coral_sea_OR_battle_of_wagram_aux().

