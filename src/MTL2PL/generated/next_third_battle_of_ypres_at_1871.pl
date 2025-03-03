:- include('database.pl').
third_battle_of_ypres(Start,End) :- begin('third_battle_of_ypres',_,_,Start), end('third_battle_of_ypres',_,_,End), Start=<End.

next_third_battle_of_ypres(Start,End) :- third_battle_of_ypres(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_third_battle_of_ypres_at_1871(Res) :- setof((Start,End),next_third_battle_of_ypres(Start,End),AllINtervals), checkvalidity(1871,AllINtervals,Res).

check_query() :- write('Query = next_third_battle_of_ypres_at_1871'), (next_third_battle_of_ypres_at_1871(true) -> write('\nRes   = true');write('\nRes   = false')).

