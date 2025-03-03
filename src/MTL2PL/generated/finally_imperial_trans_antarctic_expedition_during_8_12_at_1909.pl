:- include('database.pl').
imperial_trans_antarctic_expedition(Start,End) :- begin('imperial_trans_antarctic_expedition',_,_,Start), end('imperial_trans_antarctic_expedition',_,_,End), Start=<End.

finally_imperial_trans_antarctic_expedition_during_8_12(Start,End) :- imperial_trans_antarctic_expedition(Start1,End1), (Start1-12)=<(End1-8), Start is (Start1-12), End is (End1-8), Start=<End.

finally_imperial_trans_antarctic_expedition_during_8_12_at_1909(Res) :- setof((Start,End),finally_imperial_trans_antarctic_expedition_during_8_12(Start,End),AllINtervals), checkvalidity(1909,AllINtervals,Res).

check_query() :- write('Query = finally_imperial_trans_antarctic_expedition_during_8_12_at_1909'), (finally_imperial_trans_antarctic_expedition_during_8_12_at_1909(true) -> write('\nRes   = true');write('\nRes   = false')).

