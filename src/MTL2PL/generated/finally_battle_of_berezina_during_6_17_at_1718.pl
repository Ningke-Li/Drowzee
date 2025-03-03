:- include('database.pl').
battle_of_berezina(Start,End) :- begin('battle_of_berezina',_,_,Start), end('battle_of_berezina',_,_,End), Start=<End.

finally_battle_of_berezina_during_6_17(Start,End) :- battle_of_berezina(Start1,End1), (Start1-17)=<(End1-6), Start is (Start1-17), End is (End1-6), Start=<End.

finally_battle_of_berezina_during_6_17_at_1718(Res) :- setof((Start,End),finally_battle_of_berezina_during_6_17(Start,End),AllINtervals), checkvalidity(1718,AllINtervals,Res).

check_query() :- write('Query = finally_battle_of_berezina_during_6_17_at_1718'), (finally_battle_of_berezina_during_6_17_at_1718(true) -> write('\nRes   = true');write('\nRes   = false')).

