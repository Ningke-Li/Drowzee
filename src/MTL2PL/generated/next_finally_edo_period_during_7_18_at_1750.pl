:- include('database.pl').
edo_period(Start,End) :- begin('edo_period',_,_,Start), end('edo_period',_,_,End), Start=<End.

finally_edo_period_during_7_18(Start,End) :- edo_period(Start1,End1), (Start1-18)=<(End1-7), Start is (Start1-18), End is (End1-7), Start=<End.

next_finally_edo_period_during_7_18(Start,End) :- finally_edo_period_during_7_18(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_edo_period_during_7_18_at_1750(Res) :- setof((Start,End),next_finally_edo_period_during_7_18(Start,End),AllINtervals), checkvalidity(1750,AllINtervals,Res).

check_query() :- write('Query = next_finally_edo_period_during_7_18_at_1750'), (next_finally_edo_period_during_7_18_at_1750(true) -> write('\nRes   = true');write('\nRes   = false')).

