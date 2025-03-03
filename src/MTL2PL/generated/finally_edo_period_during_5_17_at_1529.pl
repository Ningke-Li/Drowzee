:- include('database.pl').
edo_period(Start,End) :- begin('edo_period',_,_,Start), end('edo_period',_,_,End), Start=<End.

finally_edo_period_during_5_17(Start,End) :- edo_period(Start1,End1), (Start1-17)=<(End1-5), Start is (Start1-17), End is (End1-5), Start=<End.

finally_edo_period_during_5_17_at_1529(Res) :- setof((Start,End),finally_edo_period_during_5_17(Start,End),AllINtervals), checkvalidity(1529,AllINtervals,Res).

check_query() :- write('Query = finally_edo_period_during_5_17_at_1529'), (finally_edo_period_during_5_17_at_1529(true) -> write('\nRes   = true');write('\nRes   = false')).

