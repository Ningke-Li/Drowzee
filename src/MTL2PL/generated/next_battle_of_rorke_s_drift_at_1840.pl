:- include('database.pl').
battle_of_rorke_s_drift(Start,End) :- begin('battle_of_rorke_s_drift',_,_,Start), end('battle_of_rorke_s_drift',_,_,End), Start=<End.

next_battle_of_rorke_s_drift(Start,End) :- battle_of_rorke_s_drift(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_battle_of_rorke_s_drift_at_1840(Res) :- setof((Start,End),next_battle_of_rorke_s_drift(Start,End),AllINtervals), checkvalidity(1840,AllINtervals,Res).

check_query() :- write('Query = next_battle_of_rorke_s_drift_at_1840'), (next_battle_of_rorke_s_drift_at_1840(true) -> write('\nRes   = true');write('\nRes   = false')).

