:- include('database.pl').
easter_rising(Start,End) :- begin('easter_rising',_,_,Start), end('easter_rising',_,_,End), Start=<End.

battle_of_lake_khasan(Start,End) :- begin('battle_of_lake_khasan',_,_,Start), end('battle_of_lake_khasan',_,_,End), Start=<End.

generate_facts_easter_rising_OR_battle_of_lake_khasan([]) :- assert(easter_rising_OR_battle_of_lake_khasan(-1,-1)).

generate_facts_easter_rising_OR_battle_of_lake_khasan([(Start,End) | Tail]) :- assert(easter_rising_OR_battle_of_lake_khasan(Start,End)), generate_facts_easter_rising_OR_battle_of_lake_khasan(Tail).

easter_rising_OR_battle_of_lake_khasan_aux() :- findall((Start,End),easter_rising(Start,End),Interval1), findall((Start,End),battle_of_lake_khasan(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_easter_rising_OR_battle_of_lake_khasan(Interval).

easter_rising_OR_battle_of_lake_khasan_at_1796(Res) :- setof((Start,End),easter_rising_OR_battle_of_lake_khasan(Start,End),AllINtervals), checkvalidity(1796,AllINtervals,Res).

check_query() :- write('Query = easter_rising_OR_battle_of_lake_khasan_at_1796'), (easter_rising_OR_battle_of_lake_khasan_at_1796(true) -> write('\nRes   = true');write('\nRes   = false')).
?- easter_rising_OR_battle_of_lake_khasan_aux().

