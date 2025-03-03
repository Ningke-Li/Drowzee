:- include('database.pl').
first_moroccan_crisis(Start,End) :- begin('first_moroccan_crisis',_,_,Start), end('first_moroccan_crisis',_,_,End), Start=<End.

battle_of_moscow(Start,End) :- begin('battle_of_moscow',_,_,Start), end('battle_of_moscow',_,_,End), Start=<End.

generate_facts_first_moroccan_crisis_OR_battle_of_moscow([]) :- assert(first_moroccan_crisis_OR_battle_of_moscow(-1,-1)).

generate_facts_first_moroccan_crisis_OR_battle_of_moscow([(Start,End) | Tail]) :- assert(first_moroccan_crisis_OR_battle_of_moscow(Start,End)), generate_facts_first_moroccan_crisis_OR_battle_of_moscow(Tail).

first_moroccan_crisis_OR_battle_of_moscow_aux() :- findall((Start,End),first_moroccan_crisis(Start,End),Interval1), findall((Start,End),battle_of_moscow(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_first_moroccan_crisis_OR_battle_of_moscow(Interval).

first_moroccan_crisis_OR_battle_of_moscow_at_1941(Res) :- setof((Start,End),first_moroccan_crisis_OR_battle_of_moscow(Start,End),AllINtervals), checkvalidity(1941,AllINtervals,Res).

check_query() :- write('Query = first_moroccan_crisis_OR_battle_of_moscow_at_1941'), (first_moroccan_crisis_OR_battle_of_moscow_at_1941(true) -> write('\nRes   = true');write('\nRes   = false')).
?- first_moroccan_crisis_OR_battle_of_moscow_aux().

