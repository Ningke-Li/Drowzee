:- include('database.pl').
third_battle_of_ypres(Start,End) :- begin('third_battle_of_ypres',_,_,Start), end('third_battle_of_ypres',_,_,End), Start=<End.

finally_third_battle_of_ypres_during_10_11(Start,End) :- third_battle_of_ypres(Start1,End1), (Start1-11)=<(End1-10), Start is (Start1-11), End is (End1-10), Start=<End.

finally_third_battle_of_ypres_during_10_11_at_1907(Res) :- setof((Start,End),finally_third_battle_of_ypres_during_10_11(Start,End),AllINtervals), checkvalidity(1907,AllINtervals,Res).

check_query() :- write('Query = finally_third_battle_of_ypres_during_10_11_at_1907'), (finally_third_battle_of_ypres_during_10_11_at_1907(true) -> write('\nRes   = true');write('\nRes   = false')).

