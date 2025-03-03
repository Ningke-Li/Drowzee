:- include('database.pl').
jim_crow_laws(Start,End) :- begin('jim_crow_laws',_,_,Start), end('jim_crow_laws',_,_,End), Start=<End.

battle_of_h_rtgen_forest(Start,End) :- begin('battle_of_h_rtgen_forest',_,_,Start), end('battle_of_h_rtgen_forest',_,_,End), Start=<End.

jim_crow_laws_last_till_23_26(Start,End) :- jim_crow_laws(Start1,End1), (End1-Start1)>=23, Start is (Start1+23), End is (End1+1).

jim_crow_laws_until_battle_of_h_rtgen_forest_during_23_26_overlap(Start,End) :- jim_crow_laws_last_till_23_26(Start1,End1), battle_of_h_rtgen_forest(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

jim_crow_laws_until_battle_of_h_rtgen_forest_during_23_26(Start,End) :- jim_crow_laws(W1,_), jim_crow_laws_until_battle_of_h_rtgen_forest_during_23_26_overlap(Start1,End1), Start is max((Start1-26),W1), End is (End1-23), Start=<End.

jim_crow_laws_until_battle_of_h_rtgen_forest_during_23_26_at_1885(Res) :- setof((Start,End),jim_crow_laws_until_battle_of_h_rtgen_forest_during_23_26(Start,End),AllINtervals), checkvalidity(1885,AllINtervals,Res).

check_query() :- write('Query = jim_crow_laws_until_battle_of_h_rtgen_forest_during_23_26_at_1885'), (jim_crow_laws_until_battle_of_h_rtgen_forest_during_23_26_at_1885(true) -> write('\nRes   = true');write('\nRes   = false')).

