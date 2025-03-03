:- include('database.pl').
chelyabinsk_meteor(Start,End) :- begin('chelyabinsk_meteor',_,_,Start), end('chelyabinsk_meteor',_,_,End), Start=<End.

battle_of_peleliu(Start,End) :- begin('battle_of_peleliu',_,_,Start), end('battle_of_peleliu',_,_,End), Start=<End.

generate_facts_chelyabinsk_meteor_OR_battle_of_peleliu([]) :- assert(chelyabinsk_meteor_OR_battle_of_peleliu(-1,-1)).

generate_facts_chelyabinsk_meteor_OR_battle_of_peleliu([(Start,End) | Tail]) :- assert(chelyabinsk_meteor_OR_battle_of_peleliu(Start,End)), generate_facts_chelyabinsk_meteor_OR_battle_of_peleliu(Tail).

chelyabinsk_meteor_OR_battle_of_peleliu_aux() :- findall((Start,End),chelyabinsk_meteor(Start,End),Interval1), findall((Start,End),battle_of_peleliu(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_chelyabinsk_meteor_OR_battle_of_peleliu(Interval).

chelyabinsk_meteor_OR_battle_of_peleliu_at_1949(Res) :- setof((Start,End),chelyabinsk_meteor_OR_battle_of_peleliu(Start,End),AllINtervals), checkvalidity(1949,AllINtervals,Res).

check_query() :- write('Query = chelyabinsk_meteor_OR_battle_of_peleliu_at_1949'), (chelyabinsk_meteor_OR_battle_of_peleliu_at_1949(true) -> write('\nRes   = true');write('\nRes   = false')).
?- chelyabinsk_meteor_OR_battle_of_peleliu_aux().

