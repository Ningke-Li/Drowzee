:- include('database.pl').
battle_of_aspern_essling(Start,End) :- begin('battle_of_aspern_essling',_,_,Start), end('battle_of_aspern_essling',_,_,End), Start=<End.

finally_battle_of_aspern_essling_during_1_16(Start,End) :- battle_of_aspern_essling(Start1,End1), (Start1-16)=<(End1-1), Start is (Start1-16), End is (End1-1), Start=<End.

finally_battle_of_aspern_essling_during_1_16_at_1731(Res) :- setof((Start,End),finally_battle_of_aspern_essling_during_1_16(Start,End),AllINtervals), checkvalidity(1731,AllINtervals,Res).

check_query() :- write('Query = finally_battle_of_aspern_essling_during_1_16_at_1731'), (finally_battle_of_aspern_essling_during_1_16_at_1731(true) -> write('\nRes   = true');write('\nRes   = false')).

