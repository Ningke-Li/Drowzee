:- include('database.pl').
battle_of_stalingrad(Start,End) :- begin('battle_of_stalingrad',_,_,Start), end('battle_of_stalingrad',_,_,End), Start=<End.

finally_battle_of_stalingrad_during_9_15(Start,End) :- battle_of_stalingrad(Start1,End1), (Start1-15)=<(End1-9), Start is (Start1-15), End is (End1-9), Start=<End.

finally_battle_of_stalingrad_during_9_15_at_1933(Res) :- setof((Start,End),finally_battle_of_stalingrad_during_9_15(Start,End),AllINtervals), checkvalidity(1933,AllINtervals,Res).

check_query() :- write('Query = finally_battle_of_stalingrad_during_9_15_at_1933'), (finally_battle_of_stalingrad_during_9_15_at_1933(true) -> write('\nRes   = true');write('\nRes   = false')).

