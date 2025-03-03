:- include('database.pl').
tulip_period(Start,End) :- begin('tulip_period',_,_,Start), end('tulip_period',_,_,End), Start=<End.

globally_tulip_period_during_1_8(Start,End) :- tulip_period(Start1,End1), Start is (Start1-1), End is (End1-8), Start=<End.

next_globally_tulip_period_during_1_8(Start,End) :- globally_tulip_period_during_1_8(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_tulip_period_during_1_8_at_1740(Res) :- setof((Start,End),next_globally_tulip_period_during_1_8(Start,End),AllINtervals), checkvalidity(1740,AllINtervals,Res).

check_query() :- write('Query = next_globally_tulip_period_during_1_8_at_1740'), (next_globally_tulip_period_during_1_8_at_1740(true) -> write('\nRes   = true');write('\nRes   = false')).

