:- include('database.pl').
expo_2010_shanghai_china(Start,End) :- begin('expo_2010_shanghai_china',_,_,Start), end('expo_2010_shanghai_china',_,_,End), Start=<End.

finally_expo_2010_shanghai_china_during_2_16(Start,End) :- expo_2010_shanghai_china(Start1,End1), (Start1-16)=<(End1-2), Start is (Start1-16), End is (End1-2), Start=<End.

finally_expo_2010_shanghai_china_during_2_16_at_1946(Res) :- setof((Start,End),finally_expo_2010_shanghai_china_during_2_16(Start,End),AllINtervals), checkvalidity(1946,AllINtervals,Res).

check_query() :- write('Query = finally_expo_2010_shanghai_china_during_2_16_at_1946'), (finally_expo_2010_shanghai_china_during_2_16_at_1946(true) -> write('\nRes   = true');write('\nRes   = false')).

