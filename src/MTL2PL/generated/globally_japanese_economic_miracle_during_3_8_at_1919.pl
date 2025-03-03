:- include('database.pl').
japanese_economic_miracle(Start,End) :- begin('japanese_economic_miracle',_,_,Start), end('japanese_economic_miracle',_,_,End), Start=<End.

globally_japanese_economic_miracle_during_3_8(Start,End) :- japanese_economic_miracle(Start1,End1), Start is (Start1-3), End is (End1-8), Start=<End.

globally_japanese_economic_miracle_during_3_8_at_1919(Res) :- setof((Start,End),globally_japanese_economic_miracle_during_3_8(Start,End),AllINtervals), checkvalidity(1919,AllINtervals,Res).

check_query() :- write('Query = globally_japanese_economic_miracle_during_3_8_at_1919'), (globally_japanese_economic_miracle_during_3_8_at_1919(true) -> write('\nRes   = true');write('\nRes   = false')).

