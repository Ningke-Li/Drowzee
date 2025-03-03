:- include('database.pl').
early_modern_period(Start,End) :- begin('early_modern_period',_,_,Start), end('early_modern_period',_,_,End), Start=<End.

finally_early_modern_period_during_2_11(Start,End) :- early_modern_period(Start1,End1), (Start1-11)=<(End1-2), Start is (Start1-11), End is (End1-2), Start=<End.

finally_early_modern_period_during_2_11_at_1596(Res) :- setof((Start,End),finally_early_modern_period_during_2_11(Start,End),AllINtervals), checkvalidity(1596,AllINtervals,Res).

check_query() :- write('Query = finally_early_modern_period_during_2_11_at_1596'), (finally_early_modern_period_during_2_11_at_1596(true) -> write('\nRes   = true');write('\nRes   = false')).

