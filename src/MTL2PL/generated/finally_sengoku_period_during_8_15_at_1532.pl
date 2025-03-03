:- include('database.pl').
sengoku_period(Start,End) :- begin('sengoku_period',_,_,Start), end('sengoku_period',_,_,End), Start=<End.

finally_sengoku_period_during_8_15(Start,End) :- sengoku_period(Start1,End1), (Start1-15)=<(End1-8), Start is (Start1-15), End is (End1-8), Start=<End.

finally_sengoku_period_during_8_15_at_1532(Res) :- setof((Start,End),finally_sengoku_period_during_8_15(Start,End),AllINtervals), checkvalidity(1532,AllINtervals,Res).

check_query() :- write('Query = finally_sengoku_period_during_8_15_at_1532'), (finally_sengoku_period_during_8_15_at_1532(true) -> write('\nRes   = true');write('\nRes   = false')).

