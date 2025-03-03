:- include('database.pl').
saar_offensive(Start,End) :- begin('saar_offensive',_,_,Start), end('saar_offensive',_,_,End), Start=<End.

battle_of_westerplatte(Start,End) :- begin('battle_of_westerplatte',_,_,Start), end('battle_of_westerplatte',_,_,End), Start=<End.

generate_facts_saar_offensive_OR_battle_of_westerplatte([]) :- assert(saar_offensive_OR_battle_of_westerplatte(-1,-1)).

generate_facts_saar_offensive_OR_battle_of_westerplatte([(Start,End) | Tail]) :- assert(saar_offensive_OR_battle_of_westerplatte(Start,End)), generate_facts_saar_offensive_OR_battle_of_westerplatte(Tail).

saar_offensive_OR_battle_of_westerplatte_aux() :- findall((Start,End),saar_offensive(Start,End),Interval1), findall((Start,End),battle_of_westerplatte(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_saar_offensive_OR_battle_of_westerplatte(Interval).

saar_offensive_OR_battle_of_westerplatte_at_1800(Res) :- setof((Start,End),saar_offensive_OR_battle_of_westerplatte(Start,End),AllINtervals), checkvalidity(1800,AllINtervals,Res).

check_query() :- write('Query = saar_offensive_OR_battle_of_westerplatte_at_1800'), (saar_offensive_OR_battle_of_westerplatte_at_1800(true) -> write('\nRes   = true');write('\nRes   = false')).
?- saar_offensive_OR_battle_of_westerplatte_aux().

