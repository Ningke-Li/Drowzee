:- include('database.pl').
imperial_trans_antarctic_expedition(Start,End) :- begin('imperial_trans_antarctic_expedition',_,_,Start), end('imperial_trans_antarctic_expedition',_,_,End), Start=<End.

finally_imperial_trans_antarctic_expedition_during_9_14(Start,End) :- imperial_trans_antarctic_expedition(Start1,End1), (Start1-14)=<(End1-9), Start is (Start1-14), End is (End1-9), Start=<End.

finally_imperial_trans_antarctic_expedition_during_9_14_at_1900(Res) :- setof((Start,End),finally_imperial_trans_antarctic_expedition_during_9_14(Start,End),AllINtervals), checkvalidity(1900,AllINtervals,Res).

check_query() :- write('Query = finally_imperial_trans_antarctic_expedition_during_9_14_at_1900'), (finally_imperial_trans_antarctic_expedition_during_9_14_at_1900(true) -> write('\nRes   = true');write('\nRes   = false')).

