:- include('database.pl').
battle_of_caporetto(Start,End) :- begin('battle_of_caporetto',_,_,Start), end('battle_of_caporetto',_,_,End), Start=<End.

finally_battle_of_caporetto_during_4_12(Start,End) :- battle_of_caporetto(Start1,End1), (Start1-12)=<(End1-4), Start is (Start1-12), End is (End1-4), Start=<End.

finally_battle_of_caporetto_during_4_12_at_1913(Res) :- setof((Start,End),finally_battle_of_caporetto_during_4_12(Start,End),AllINtervals), checkvalidity(1913,AllINtervals,Res).

check_query() :- write('Query = finally_battle_of_caporetto_during_4_12_at_1913'), (finally_battle_of_caporetto_during_4_12_at_1913(true) -> write('\nRes   = true');write('\nRes   = false')).

