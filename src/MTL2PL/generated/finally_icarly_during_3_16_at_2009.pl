:- include('database.pl').
icarly(Start,End) :- begin('icarly',_,_,Start), end('icarly',_,_,End), Start=<End.

finally_icarly_during_3_16(Start,End) :- icarly(Start1,End1), (Start1-16)=<(End1-3), Start is (Start1-16), End is (End1-3), Start=<End.

finally_icarly_during_3_16_at_2009(Res) :- setof((Start,End),finally_icarly_during_3_16(Start,End),AllINtervals), checkvalidity(2009,AllINtervals,Res).

check_query() :- write('Query = finally_icarly_during_3_16_at_2009'), (finally_icarly_during_3_16_at_2009(true) -> write('\nRes   = true');write('\nRes   = false')).

