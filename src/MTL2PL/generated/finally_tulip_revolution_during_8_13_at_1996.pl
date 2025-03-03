:- include('database.pl').
tulip_revolution(Start,End) :- begin('tulip_revolution',_,_,Start), end('tulip_revolution',_,_,End), Start=<End.

finally_tulip_revolution_during_8_13(Start,End) :- tulip_revolution(Start1,End1), (Start1-13)=<(End1-8), Start is (Start1-13), End is (End1-8), Start=<End.

finally_tulip_revolution_during_8_13_at_1996(Res) :- setof((Start,End),finally_tulip_revolution_during_8_13(Start,End),AllINtervals), checkvalidity(1996,AllINtervals,Res).

check_query() :- write('Query = finally_tulip_revolution_during_8_13_at_1996'), (finally_tulip_revolution_during_8_13_at_1996(true) -> write('\nRes   = true');write('\nRes   = false')).

