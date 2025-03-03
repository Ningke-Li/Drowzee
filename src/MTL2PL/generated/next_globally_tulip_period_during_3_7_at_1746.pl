:- include('database.pl').
tulip_period(Start,End) :- begin('tulip_period',_,_,Start), end('tulip_period',_,_,End), Start=<End.

globally_tulip_period_during_3_7(Start,End) :- tulip_period(Start1,End1), Start is (Start1-3), End is (End1-7), Start=<End.

next_globally_tulip_period_during_3_7(Start,End) :- globally_tulip_period_during_3_7(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_tulip_period_during_3_7_at_1746(Res) :- setof((Start,End),next_globally_tulip_period_during_3_7(Start,End),AllINtervals), checkvalidity(1746,AllINtervals,Res).

check_query() :- write('Query = next_globally_tulip_period_during_3_7_at_1746'), (next_globally_tulip_period_during_3_7_at_1746(true) -> write('\nRes   = true');write('\nRes   = false')).

