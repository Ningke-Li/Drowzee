:- include('database.pl').
luxembourg_franc(Start,End) :- begin('luxembourg_franc',_,_,Start), end('luxembourg_franc',_,_,End), Start=<End.

battle_of_h_rtgen_forest(Start,End) :- begin('battle_of_h_rtgen_forest',_,_,Start), end('battle_of_h_rtgen_forest',_,_,End), Start=<End.

luxembourg_franc_last_till_70_76(Start,End) :- luxembourg_franc(Start1,End1), (End1-Start1)>=70, Start is (Start1+70), End is (End1+1).

luxembourg_franc_until_battle_of_h_rtgen_forest_during_70_76_overlap(Start,End) :- luxembourg_franc_last_till_70_76(Start1,End1), battle_of_h_rtgen_forest(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

luxembourg_franc_until_battle_of_h_rtgen_forest_during_70_76(Start,End) :- luxembourg_franc(W1,_), luxembourg_franc_until_battle_of_h_rtgen_forest_during_70_76_overlap(Start1,End1), Start is max((Start1-76),W1), End is (End1-70), Start=<End.

luxembourg_franc_until_battle_of_h_rtgen_forest_during_70_76_at_1875(Res) :- setof((Start,End),luxembourg_franc_until_battle_of_h_rtgen_forest_during_70_76(Start,End),AllINtervals), checkvalidity(1875,AllINtervals,Res).

check_query() :- write('Query = luxembourg_franc_until_battle_of_h_rtgen_forest_during_70_76_at_1875'), (luxembourg_franc_until_battle_of_h_rtgen_forest_during_70_76_at_1875(true) -> write('\nRes   = true');write('\nRes   = false')).

