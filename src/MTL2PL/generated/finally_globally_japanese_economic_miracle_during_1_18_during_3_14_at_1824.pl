:- include('database.pl').
japanese_economic_miracle(Start,End) :- begin('japanese_economic_miracle',_,_,Start), end('japanese_economic_miracle',_,_,End), Start=<End.

globally_japanese_economic_miracle_during_1_18(Start,End) :- japanese_economic_miracle(Start1,End1), Start is (Start1-1), End is (End1-18), Start=<End.

finally_globally_japanese_economic_miracle_during_1_18_during_3_14(Start,End) :- globally_japanese_economic_miracle_during_1_18(Start1,End1), (Start1-14)=<(End1-3), Start is (Start1-14), End is (End1-3), Start=<End.

finally_globally_japanese_economic_miracle_during_1_18_during_3_14_at_1824(Res) :- setof((Start,End),finally_globally_japanese_economic_miracle_during_1_18_during_3_14(Start,End),AllINtervals), checkvalidity(1824,AllINtervals,Res).

check_query() :- write('Query = finally_globally_japanese_economic_miracle_during_1_18_during_3_14_at_1824'), (finally_globally_japanese_economic_miracle_during_1_18_during_3_14_at_1824(true) -> write('\nRes   = true');write('\nRes   = false')).

