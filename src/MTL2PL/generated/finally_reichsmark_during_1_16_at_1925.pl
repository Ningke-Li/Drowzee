:- include('database.pl').
reichsmark(Start,End) :- begin('reichsmark',_,_,Start), end('reichsmark',_,_,End), Start=<End.

finally_reichsmark_during_1_16(Start,End) :- reichsmark(Start1,End1), (Start1-16)=<(End1-1), Start is (Start1-16), End is (End1-1), Start=<End.

finally_reichsmark_during_1_16_at_1925(Res) :- setof((Start,End),finally_reichsmark_during_1_16(Start,End),AllINtervals), checkvalidity(1925,AllINtervals,Res).

check_query() :- write('Query = finally_reichsmark_during_1_16_at_1925'), (finally_reichsmark_during_1_16_at_1925(true) -> write('\nRes   = true');write('\nRes   = false')).

