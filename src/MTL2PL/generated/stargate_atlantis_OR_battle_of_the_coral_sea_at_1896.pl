:- include('database.pl').
stargate_atlantis(Start,End) :- begin('stargate_atlantis',_,_,Start), end('stargate_atlantis',_,_,End), Start=<End.

battle_of_the_coral_sea(Start,End) :- begin('battle_of_the_coral_sea',_,_,Start), end('battle_of_the_coral_sea',_,_,End), Start=<End.

generate_facts_stargate_atlantis_OR_battle_of_the_coral_sea([]) :- assert(stargate_atlantis_OR_battle_of_the_coral_sea(-1,-1)).

generate_facts_stargate_atlantis_OR_battle_of_the_coral_sea([(Start,End) | Tail]) :- assert(stargate_atlantis_OR_battle_of_the_coral_sea(Start,End)), generate_facts_stargate_atlantis_OR_battle_of_the_coral_sea(Tail).

stargate_atlantis_OR_battle_of_the_coral_sea_aux() :- findall((Start,End),stargate_atlantis(Start,End),Interval1), findall((Start,End),battle_of_the_coral_sea(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_stargate_atlantis_OR_battle_of_the_coral_sea(Interval).

stargate_atlantis_OR_battle_of_the_coral_sea_at_1896(Res) :- setof((Start,End),stargate_atlantis_OR_battle_of_the_coral_sea(Start,End),AllINtervals), checkvalidity(1896,AllINtervals,Res).

check_query() :- write('Query = stargate_atlantis_OR_battle_of_the_coral_sea_at_1896'), (stargate_atlantis_OR_battle_of_the_coral_sea_at_1896(true) -> write('\nRes   = true');write('\nRes   = false')).
?- stargate_atlantis_OR_battle_of_the_coral_sea_aux().

