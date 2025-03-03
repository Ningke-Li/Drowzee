:- include('database.pl').
sengoku_period(Start,End) :- begin('sengoku_period',_,_,Start), end('sengoku_period',_,_,End), Start=<End.

globally_sengoku_period_during_40_78(Start,End) :- sengoku_period(Start1,End1), Start is (Start1-40), End is (End1-78), Start=<End.

finally_globally_sengoku_period_during_40_78_during_4_14(Start,End) :- globally_sengoku_period_during_40_78(Start1,End1), (Start1-14)=<(End1-4), Start is (Start1-14), End is (End1-4), Start=<End.

finally_globally_sengoku_period_during_40_78_during_4_14_at_1434(Res) :- setof((Start,End),finally_globally_sengoku_period_during_40_78_during_4_14(Start,End),AllINtervals), checkvalidity(1434,AllINtervals,Res).

check_query() :- write('Query = finally_globally_sengoku_period_during_40_78_during_4_14_at_1434'), (finally_globally_sengoku_period_during_40_78_during_4_14_at_1434(true) -> write('\nRes   = true');write('\nRes   = false')).

