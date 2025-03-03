:- include('database.pl').
tulip_period(Start,End) :- begin('tulip_period',_,_,Start), end('tulip_period',_,_,End), Start=<End.

next_tulip_period(Start,End) :- tulip_period(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_tulip_period_at_1632(Res) :- setof((Start,End),next_tulip_period(Start,End),AllINtervals), checkvalidity(1632,AllINtervals,Res).

check_query() :- write('Query = next_tulip_period_at_1632'), (next_tulip_period_at_1632(true) -> write('\nRes   = true');write('\nRes   = false')).

