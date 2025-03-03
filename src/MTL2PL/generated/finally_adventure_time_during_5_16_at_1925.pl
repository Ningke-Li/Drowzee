:- include('database.pl').
adventure_time(Start,End) :- begin('adventure_time',_,_,Start), end('adventure_time',_,_,End), Start=<End.

finally_adventure_time_during_5_16(Start,End) :- adventure_time(Start1,End1), (Start1-16)=<(End1-5), Start is (Start1-16), End is (End1-5), Start=<End.

finally_adventure_time_during_5_16_at_1925(Res) :- setof((Start,End),finally_adventure_time_during_5_16(Start,End),AllINtervals), checkvalidity(1925,AllINtervals,Res).

check_query() :- write('Query = finally_adventure_time_during_5_16_at_1925'), (finally_adventure_time_during_5_16_at_1925(true) -> write('\nRes   = true');write('\nRes   = false')).

