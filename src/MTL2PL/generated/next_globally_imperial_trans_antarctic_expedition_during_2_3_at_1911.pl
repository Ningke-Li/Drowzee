:- include('database.pl').
imperial_trans_antarctic_expedition(Start,End) :- begin('imperial_trans_antarctic_expedition',_,_,Start), end('imperial_trans_antarctic_expedition',_,_,End), Start=<End.

globally_imperial_trans_antarctic_expedition_during_2_3(Start,End) :- imperial_trans_antarctic_expedition(Start1,End1), Start is (Start1-2), End is (End1-3), Start=<End.

next_globally_imperial_trans_antarctic_expedition_during_2_3(Start,End) :- globally_imperial_trans_antarctic_expedition_during_2_3(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_imperial_trans_antarctic_expedition_during_2_3_at_1911(Res) :- setof((Start,End),next_globally_imperial_trans_antarctic_expedition_during_2_3(Start,End),AllINtervals), checkvalidity(1911,AllINtervals,Res).

check_query() :- write('Query = next_globally_imperial_trans_antarctic_expedition_during_2_3_at_1911'), (next_globally_imperial_trans_antarctic_expedition_during_2_3_at_1911(true) -> write('\nRes   = true');write('\nRes   = false')).

