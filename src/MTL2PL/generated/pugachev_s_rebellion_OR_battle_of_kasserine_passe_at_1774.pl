:- include('database.pl').
pugachev_s_rebellion(Start,End) :- begin('pugachev_s_rebellion',_,_,Start), end('pugachev_s_rebellion',_,_,End), Start=<End.

battle_of_kasserine_passe(Start,End) :- begin('battle_of_kasserine_passe',_,_,Start), end('battle_of_kasserine_passe',_,_,End), Start=<End.

generate_facts_pugachev_s_rebellion_OR_battle_of_kasserine_passe([]) :- assert(pugachev_s_rebellion_OR_battle_of_kasserine_passe(-1,-1)).

generate_facts_pugachev_s_rebellion_OR_battle_of_kasserine_passe([(Start,End) | Tail]) :- assert(pugachev_s_rebellion_OR_battle_of_kasserine_passe(Start,End)), generate_facts_pugachev_s_rebellion_OR_battle_of_kasserine_passe(Tail).

pugachev_s_rebellion_OR_battle_of_kasserine_passe_aux() :- findall((Start,End),pugachev_s_rebellion(Start,End),Interval1), findall((Start,End),battle_of_kasserine_passe(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_pugachev_s_rebellion_OR_battle_of_kasserine_passe(Interval).

pugachev_s_rebellion_OR_battle_of_kasserine_passe_at_1774(Res) :- setof((Start,End),pugachev_s_rebellion_OR_battle_of_kasserine_passe(Start,End),AllINtervals), checkvalidity(1774,AllINtervals,Res).

check_query() :- write('Query = pugachev_s_rebellion_OR_battle_of_kasserine_passe_at_1774'), (pugachev_s_rebellion_OR_battle_of_kasserine_passe_at_1774(true) -> write('\nRes   = true');write('\nRes   = false')).
?- pugachev_s_rebellion_OR_battle_of_kasserine_passe_aux().

