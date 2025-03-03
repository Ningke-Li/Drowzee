:- include('database.pl').
chelyabinsk_meteor(Start,End) :- begin('chelyabinsk_meteor',_,_,Start), end('chelyabinsk_meteor',_,_,End), Start=<End.

battle_of_greece(Start,End) :- begin('battle_of_greece',_,_,Start), end('battle_of_greece',_,_,End), Start=<End.

generate_facts_chelyabinsk_meteor_OR_battle_of_greece([]) :- assert(chelyabinsk_meteor_OR_battle_of_greece(-1,-1)).

generate_facts_chelyabinsk_meteor_OR_battle_of_greece([(Start,End) | Tail]) :- assert(chelyabinsk_meteor_OR_battle_of_greece(Start,End)), generate_facts_chelyabinsk_meteor_OR_battle_of_greece(Tail).

chelyabinsk_meteor_OR_battle_of_greece_aux() :- findall((Start,End),chelyabinsk_meteor(Start,End),Interval1), findall((Start,End),battle_of_greece(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_chelyabinsk_meteor_OR_battle_of_greece(Interval).

chelyabinsk_meteor_OR_battle_of_greece_at_2059(Res) :- setof((Start,End),chelyabinsk_meteor_OR_battle_of_greece(Start,End),AllINtervals), checkvalidity(2059,AllINtervals,Res).

check_query() :- write('Query = chelyabinsk_meteor_OR_battle_of_greece_at_2059'), (chelyabinsk_meteor_OR_battle_of_greece_at_2059(true) -> write('\nRes   = true');write('\nRes   = false')).
?- chelyabinsk_meteor_OR_battle_of_greece_aux().

