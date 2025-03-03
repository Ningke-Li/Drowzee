:- include('database.pl').
mexican_revolution(Start,End) :- begin('mexican_revolution',_,_,Start), end('mexican_revolution',_,_,End), Start=<End.

battle_of_sarikamish(Start,End) :- begin('battle_of_sarikamish',_,_,Start), end('battle_of_sarikamish',_,_,End), Start=<End.

mexican_revolution_last_till_2_10(Start,End) :- mexican_revolution(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

mexican_revolution_until_battle_of_sarikamish_during_2_10_overlap(Start,End) :- mexican_revolution_last_till_2_10(Start1,End1), battle_of_sarikamish(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

mexican_revolution_until_battle_of_sarikamish_during_2_10(Start,End) :- mexican_revolution(W1,_), mexican_revolution_until_battle_of_sarikamish_during_2_10_overlap(Start1,End1), Start is max((Start1-10),W1), End is (End1-2), Start=<End.

mexican_revolution_until_battle_of_sarikamish_during_2_10_at_1829(Res) :- setof((Start,End),mexican_revolution_until_battle_of_sarikamish_during_2_10(Start,End),AllINtervals), checkvalidity(1829,AllINtervals,Res).

check_query() :- write('Query = mexican_revolution_until_battle_of_sarikamish_during_2_10_at_1829'), (mexican_revolution_until_battle_of_sarikamish_during_2_10_at_1829(true) -> write('\nRes   = true');write('\nRes   = false')).

