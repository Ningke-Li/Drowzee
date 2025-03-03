:- include('database.pl').
producer(Start,End) :- begin('producer',_,_,Start), end('producer',_,_,End), Start=<End.

battle_of_lake_khasan(Start,End) :- begin('battle_of_lake_khasan',_,_,Start), end('battle_of_lake_khasan',_,_,End), Start=<End.

generate_facts_producer_OR_battle_of_lake_khasan([]) :- assert(producer_OR_battle_of_lake_khasan(-1,-1)).

generate_facts_producer_OR_battle_of_lake_khasan([(Start,End) | Tail]) :- assert(producer_OR_battle_of_lake_khasan(Start,End)), generate_facts_producer_OR_battle_of_lake_khasan(Tail).

producer_OR_battle_of_lake_khasan_aux() :- findall((Start,End),producer(Start,End),Interval1), findall((Start,End),battle_of_lake_khasan(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_producer_OR_battle_of_lake_khasan(Interval).

producer_OR_battle_of_lake_khasan_at_2015(Res) :- setof((Start,End),producer_OR_battle_of_lake_khasan(Start,End),AllINtervals), checkvalidity(2015,AllINtervals,Res).

check_query() :- write('Query = producer_OR_battle_of_lake_khasan_at_2015'), (producer_OR_battle_of_lake_khasan_at_2015(true) -> write('\nRes   = true');write('\nRes   = false')).
?- producer_OR_battle_of_lake_khasan_aux().

