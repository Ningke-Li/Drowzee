:- include('database.pl').
tulip_period(Start,End) :- begin('tulip_period',_,_,Start), end('tulip_period',_,_,End), Start=<End.

finally_tulip_period_during_7_17(Start,End) :- tulip_period(Start1,End1), (Start1-17)=<(End1-7), Start is (Start1-17), End is (End1-7), Start=<End.

globally_finally_tulip_period_during_7_17_during_1_22(Start,End) :- finally_tulip_period_during_7_17(Start1,End1), Start is (Start1-1), End is (End1-22), Start=<End.

globally_finally_tulip_period_during_7_17_during_1_22_at_1699(Res) :- setof((Start,End),globally_finally_tulip_period_during_7_17_during_1_22(Start,End),AllINtervals), checkvalidity(1699,AllINtervals,Res).

check_query() :- write('Query = globally_finally_tulip_period_during_7_17_during_1_22_at_1699'), (globally_finally_tulip_period_during_7_17_during_1_22_at_1699(true) -> write('\nRes   = true');write('\nRes   = false')).

