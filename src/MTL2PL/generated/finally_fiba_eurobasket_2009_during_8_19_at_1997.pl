:- include('database.pl').
fiba_eurobasket_2009(Start,End) :- begin('fiba_eurobasket_2009',_,_,Start), end('fiba_eurobasket_2009',_,_,End), Start=<End.

finally_fiba_eurobasket_2009_during_8_19(Start,End) :- fiba_eurobasket_2009(Start1,End1), (Start1-19)=<(End1-8), Start is (Start1-19), End is (End1-8), Start=<End.

finally_fiba_eurobasket_2009_during_8_19_at_1997(Res) :- setof((Start,End),finally_fiba_eurobasket_2009_during_8_19(Start,End),AllINtervals), checkvalidity(1997,AllINtervals,Res).

check_query() :- write('Query = finally_fiba_eurobasket_2009_during_8_19_at_1997'), (finally_fiba_eurobasket_2009_during_8_19_at_1997(true) -> write('\nRes   = true');write('\nRes   = false')).

