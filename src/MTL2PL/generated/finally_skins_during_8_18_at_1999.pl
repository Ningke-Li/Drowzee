:- include('database.pl').
skins(Start,End) :- begin('skins',_,_,Start), end('skins',_,_,End), Start=<End.

finally_skins_during_8_18(Start,End) :- skins(Start1,End1), (Start1-18)=<(End1-8), Start is (Start1-18), End is (End1-8), Start=<End.

finally_skins_during_8_18_at_1999(Res) :- setof((Start,End),finally_skins_during_8_18(Start,End),AllINtervals), checkvalidity(1999,AllINtervals,Res).

check_query() :- write('Query = finally_skins_during_8_18_at_1999'), (finally_skins_during_8_18_at_1999(true) -> write('\nRes   = true');write('\nRes   = false')).

