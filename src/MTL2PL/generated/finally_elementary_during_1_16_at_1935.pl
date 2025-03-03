:- include('database.pl').
elementary(Start,End) :- begin('elementary',_,_,Start), end('elementary',_,_,End), Start=<End.

finally_elementary_during_1_16(Start,End) :- elementary(Start1,End1), (Start1-16)=<(End1-1), Start is (Start1-16), End is (End1-1), Start=<End.

finally_elementary_during_1_16_at_1935(Res) :- setof((Start,End),finally_elementary_during_1_16(Start,End),AllINtervals), checkvalidity(1935,AllINtervals,Res).

check_query() :- write('Query = finally_elementary_during_1_16_at_1935'), (finally_elementary_during_1_16_at_1935(true) -> write('\nRes   = true');write('\nRes   = false')).

